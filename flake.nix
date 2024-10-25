{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url="github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager,... }:
    let
      system = "x86_64-linux";
      pkgs=nixpkgs.legacyPackages.${system};
      overlay-stable = final: prev: {
        stable= import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
      };
    in {
      nixosConfigurations."default" = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ({ config, pkgs, ... }: { nixpkgs.overlays = [ overlay-stable ]; })
          ./configuration.nix
        ];
      };
      homeConfigurations={
        sam=home-manager.lib.homeManagerConfiguration{
          inherit pkgs;
          modules=[./home.nix];
        };
      };
    };
}
