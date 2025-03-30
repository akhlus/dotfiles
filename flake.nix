{
  description = "NixOS configuration";
  outputs = inputs @ {self, ...}: let
    hostname = "mba";
    type = "darwin";

    types = {
      laptop = {
        system = "x86_64-linux";
        de = "gnome";
      };
      desktop = {
        system = "x86_64-linux";
        de = "gnome";
      };
      darwin = {
        system = "aarch64-darwin";
        de = "apple";
      };
      hm = {
        system = "";
        de = "";
      };
    };

    settings = rec {
      inherit hostname;
      inherit type;
      name = "sam"; #for account
      username = "akhlus"; #for git
      email = "93236986+akhlus@users.noreply.github.com"; #for git
      flakePath = "/${home}/${name}/dotfiles"; #full path
      de = types.${type}.de;
      system = types.${type}.system;
      locale = "en_GB.UTF-8";
      timezone = "Europe/London";
      home =
        if de == "apple"
        then "Users"
        else "home";
    };

    nixpkgs-de =
      if settings.de == "cosmic"
      then inputs.nixpkgs-cosmic
      else inputs.nixpkgs;

    pkgs = nixpkgs-de.legacyPackages.${settings.system};

    pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${settings.system};

    specialArgs = {
      inherit pkgs-stable settings inputs;
    };
  in {
    nixosConfigurations."system" = nixpkgs-de.lib.nixosSystem {
      system = settings.system;
      specialArgs = specialArgs;
      modules = [
        inputs.home-manager.nixosModules.home-manager
        ./hosts/${type}/${type}.nix
        ./hosts/hardware/hardware-${hostname}.nix
      ];
    };
    homeConfigurations."home" = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./hosts/${type}/${type}-home.nix
      ];
      extraSpecialArgs = specialArgs;
    };
    darwinConfigurations."apple" = inputs.nix-darwin.lib.darwinSystem {
      specialArgs = specialArgs;
      system = settings.system;
      modules = [
        #inputs.mac-app-util.darwinModules.default
        inputs.home-manager.darwinModules.home-manager
        inputs.nix-homebrew.darwinModules.nix-homebrew
        ./hosts/${type}/${type}.nix
      ];
    };
  };
  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-cosmic.follows = "nixos-cosmic/nixpkgs";
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    #nix-flatpak.url = "github:gmodena/nix-flatpak";
  };
}
