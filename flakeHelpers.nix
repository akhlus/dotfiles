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
  mkNixos = {machineHostname, nixpkgs ? inputs.nixpkgs, home-manager ? inputs.home-manager}: {
    nixosConfigurations.${machineHostname} = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = rec {
        inherit inputs;
        flakePath = "/home/${userName}/dotfiles";
        hostName = machineHostname;
        isDarwin = false;
        userName = "sam";
      };
      modules = [
        home-manager.nixosModules.home-manager
        inputs.jovian.nixosModules.default
        ./modules/nixos
        ./hosts/${machineHostname}
      ];
    };
  };
  mkHome = userName: system: device: {
    homeConfigurations.${userName} = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      extraSpecialArgs = {
        inherit inputs;
        flakePath = "/home/${userName}/dotfiles";
        isDarwin = false;
        inherit userName;
      };
      modules = [
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
        ./hosts/${device}
        ./modules/hm
      ];
    };
  };
  mkMerge = inputs.nixpkgs.lib.lists.foldl' (
    a: b: inputs.nixpkgs.lib.attrsets.recursiveUpdate a b
  ) {};
}
