{
  description = "NixOS configuration with two or more channels";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url="github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager,... }:
    let
      system = "x86_64-linux";
      pkgs=nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations."s340" = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
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
