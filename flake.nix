{
  description = "NixOS configuration";
  outputs = inputs @ {self, ...}: let
    hostname = "mba";

    settings = import ./hosts/${hostname}/variables.nix;

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
        ./modules/nixos
        ./hosts/${hostname}
      ];
    };
    homeConfigurations."home" = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = specialArgs;
      modules = [
        ./modules/hm
        ./hosts/${hostname}/home.nix
      ];
    };
    darwinConfigurations."apple" = inputs.nix-darwin.lib.darwinSystem {
      specialArgs = specialArgs;
      system = settings.system;
      modules = [
        #inputs.mac-app-util.darwinModules.default
        inputs.home-manager.darwinModules.home-manager
        inputs.nix-homebrew.darwinModules.nix-homebrew
        ./modules/darwin
        ./hosts/${hostname}
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
  };
}
