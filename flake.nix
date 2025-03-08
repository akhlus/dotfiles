{
  description = "NixOS configuration";
  outputs = inputs @ {self, ...}: let
    machine = "mba"; # one of the options in systems variable below

    settings = rec {
      name = "sam"; #for account
      username = "akhlus"; #for git
      email = "samuellarcombe@gmail.com"; #for git
      flakePath = "/${home}/${name}/.dotfiles"; #full path
      de = systems.${machine}.de;
      hostname = systems.${machine}.hostname;
      system = systems.${machine}.system;
      locale = "en_GB.UTF-8";
      timezone = "Europe/London";
      home =
        if de == "apple"
        then "Users"
        else "home";
    };

    systems = {
      hp = {
        hostname = "hp";
        system = "x86_64-linux";
        de = "gnome";
      };
      s340 = {
        hostname = "s340";
        system = "x86_64-linux";
        de = "gnome";
      };
      desktop = {
        hostname = "desktop";
        system = "x86_64-linux";
        de = "gnome";
      };
      penguin = {
        hostname = "penguin";
        system = "aarch64-linux";
        de = "chrome";
      };
      mba = {
        hostname = "mba";
        system = "aarch64-darwin";
        de = "apple";
      };
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
        ./hosts/${settings.hostname}/${settings.hostname}.nix
      ];
    };
    homeConfigurations."home" = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        ./hosts/${settings.hostname}/${settings.hostname}-home.nix
      ];
      extraSpecialArgs = specialArgs;
    };
    darwinConfigurations."apple" = inputs.nix-darwin.lib.darwinSystem {
      specialArgs = specialArgs;
      system = settings.system;
      modules = [
        inputs.mac-app-util.darwinModules.default
        inputs.home-manager.darwinModules.home-manager
        inputs.nix-homebrew.darwinModules.nix-homebrew
        ./hosts/${settings.hostname}/${settings.hostname}.nix
      ];
    };
  };
  inputs = {
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-cosmic.follows = "nixos-cosmic/nixpkgs";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    mac-app-util.url = "github:hraban/mac-app-util";
  };
}
