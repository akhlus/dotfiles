inputs: let
  args = hostname: username: home: {
    inherit hostname username inputs;
    flakePath = "/${home}/${username}/dotfiles";
  };
in {
  mkDarwin = hostname: {
    darwinConfigurations.${hostname} = inputs.nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = args hostname "sam" "Users";
      modules = [
        inputs.home-manager.darwinModules.home-manager
        inputs.nix-homebrew.darwinModules.nix-homebrew
        ./overlays
        ./darwin
        ./hosts/${hostname}
      ];
    };
  };
  mkNixos = hostname: {
    nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = args hostname "sam" "home";
      modules = [
        inputs.home-manager.nixosModules.home-manager
        inputs.jovian.nixosModules.default
        ./overlays
        ./nixos
        ./hosts/${hostname}
      ];
    };
  };
  mkStable = hostname: {
    nixosConfigurations.${hostname} = inputs.nixpkgs-stable.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = args hostname "sam" "home";
      modules = [
        inputs.home-manager-stable.nixosModules.home-manager
        inputs.jovian.nixosModules.default
        ./overlays
        ./nixos
        ./hosts/${hostname}
      ];
    };
  };
  mkHome = username: system: hostname: {
    homeConfigurations.${username} = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      extraSpecialArgs = args hostname username "home";
      modules = [
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
        ./overlays
        ./hosts/${hostname}/home.nix
        ./hm
      ];
    };
  };
  mkMobile = hostname: device: {
    nixosConfigurations.${hostname} = inputs.nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = args hostname "sam" "home";
      modules = [
        (import "${inputs.mobile-nixos}/lib/configuration.nix" {inherit device;})
        inputs.home-manager.nixosModules.home-manager
        inputs.jovian.nixosModules.default
        ./overlays
        ./nixos
        ./hosts/${hostname}
      ];
    };
  };
  mkIso = system: rec {
    nixosConfigurations.iso = inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        "${inputs.nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
        ./hosts/iso
      ];
    };
    packages.${system}.iso = nixosConfigurations.iso.config.system.build.isoImage;
  };
  modules = {
    nixosModules = {default = ./nixos;};
    darwinModules = {default = ./darwin;};
    homeManagerModules = {default = ./hm;};
  };
  mkMerge = inputs.nixpkgs.lib.lists.foldl' (
    a: b: inputs.nixpkgs.lib.attrsets.recursiveUpdate a b
  ) {};
}
