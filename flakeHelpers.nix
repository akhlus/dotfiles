inputs: {
  mkDarwin = machineHostname: {
    darwinConfigurations.${machineHostname} = inputs.nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = rec {
        inherit inputs;
        flakePath = "/Users/${userName}/dotfiles";
        hostName = machineHostname;
        isDarwin = true;
        userName = "sam";
      };
      modules = [
        inputs.home-manager.darwinModules.home-manager
        inputs.nix-homebrew.darwinModules.nix-homebrew
        ./modules/darwin
        ./hosts/${machineHostname}
      ];
    };
  };
  mkNixos = machineHostname: {
    nixosConfigurations.${machineHostname} = inputs.nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      specialArgs = {
        inherit inputs;
        flakePath = "/home/sam/dotfiles";
        hostName = machineHostname;
        isDarwin = false;
        userName = "sam";
      };
      modules = [
        inputs.home-manager.nixosModules.home-manager
        inputs.jovian.nixosModules.default
        ./modules/nixos
        ./hosts/${machineHostname}
      ];
    };
  };
  mkMerge = inputs.nixpkgs.lib.lists.foldl' (
    a: b: inputs.nixpkgs.lib.attrsets.recursiveUpdate a b
  ) {};
}
