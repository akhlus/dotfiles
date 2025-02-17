{
  description = "NixOS configuration";
  outputs = inputs @ {self, ...}: let
    # options I change most split into own section
    machine = "hp"; # one of the options in systems variable below

    settings = rec {
      name = "sam"; #for account
      username = "akhlus"; #for git
      email = "samuellarcombe@gmail.com"; #for git
      flakePath = "/home/${name}/.dotfiles"; #full path
      de = systems.${machine}.de;
      hostname = systems.${machine}.hostname;
      system = systems.${machine}.system;
      locale = "en_GB.UTF-8";
      timezone = "Europe/London";
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
    };

    nixpkgs-de =
      if settings.de == "cosmic"
      then inputs.nixpkgs-cosmic
      else inputs.nixpkgs;

    pkgs = nixpkgs-de.legacyPackages.${settings.system};

    pkgs-stable = inputs.nixpkgs-stable.legacyPackages.${settings.system};

    specialArgs = {
      inherit pkgs-stable;
      inherit settings;
      inherit inputs;
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
  };
  inputs = {
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-cosmic.url = "github:lilyinstarlight/nixos-cosmic";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-cosmic.follows = "nixos-cosmic/nixpkgs";
  };
}
