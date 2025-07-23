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
        ./overlays
        ./darwin
        ./hosts/${machineHostname}
      ];
    };
  };
  mkNixos = machineHostname: {
    nixosConfigurations.${machineHostname} = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = rec {
        inherit inputs;
        flakePath = "/home/${userName}/dotfiles";
        hostName = machineHostname;
        userName = "sam";
      };
      modules = [
        inputs.home-manager.nixosModules.home-manager
        inputs.jovian.nixosModules.default
        ./overlays
        ./nixos
        ./hosts/${machineHostname}
      ];
    };
  };
  mkStable = machineHostname: {
    nixosConfigurations.${machineHostname} = inputs.nixpkgs-stable.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = rec {
        inherit inputs;
        flakePath = "/home/${userName}/dotfiles";
        hostName = machineHostname;
        userName = "sam";
      };
      modules = [
        inputs.home-manager-stable.nixosModules.home-manager
        inputs.jovian.nixosModules.default
        ./overlays
        ./nixos
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
        inherit userName;
      };
      modules = [
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
        ./overlays
        ./hosts/${device}/home.nix
        ./hm
      ];
    };
  };
  mkMerge = inputs.nixpkgs.lib.lists.foldl' (
    a: b: inputs.nixpkgs.lib.attrsets.recursiveUpdate a b
  ) {};
}
