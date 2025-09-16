inputs: {
  mkDarwin = machineHostname: {
    darwinConfigurations.${machineHostname} = inputs.nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = rec {
        inherit inputs;
        flakePath = "/Users/${userName}/dotfiles";
        hostName = machineHostname;
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
  mkMobile = machineHostname: device: {
    nixosConfigurations.${machineHostname} = inputs.nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = rec {
        inherit inputs;
        userName = "sam";
        flakePath = "/home/${userName}/dotfiles";
        hostName = machineHostname;
      };
      modules = [
        (import "${inputs.mobile-nixos}/lib/configuration.nix" {inherit device;})
        inputs.home-manager.nixosModules.home-manager
        inputs.jovian.nixosModules.default
        ./overlays
        ./nixos
        ./hosts/${machineHostname}
      ];
    };
  };
  mkIso = system: rec{
    nixosConfigurations.iso = inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
        ./hosts/iso
      ];
    };
    packages.${system}.iso = nixosConfigurations.iso.config.system.build.isoImage;
  };
  mkMerge = inputs.nixpkgs.lib.lists.foldl' (
    a: b: inputs.nixpkgs.lib.attrsets.recursiveUpdate a b
  ) {};
}
