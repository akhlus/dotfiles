inputs: let
  mkArgs = hostname: username: home: {
    inherit hostname username inputs;
    flakePath = "/${home}/${username}/dotfiles";
  };
in {
  mkDarwin = hostname: {
    ${hostname} = inputs.nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      specialArgs = mkArgs hostname "sam" "Users";
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
    ${hostname} = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = mkArgs hostname "sam" "home";
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
    ${hostname} = inputs.nixpkgs-stable.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = mkArgs hostname "sam" "home";
      modules = [
        inputs.home-manager-stable.nixosModules.home-manager
        inputs.jovian.nixosModules.default
        ./overlays
        ./nixos
        ./hosts/${hostname}
      ];
    };
  };
  mkHome = hostname: system: username: {
    ${hostname} = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      extraSpecialArgs = mkArgs hostname username "home";
      modules = [
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
        ./overlays
        ./hosts/${hostname}/home.nix
        ./hm
      ];
    };
  };
  mkMobile = hostname: device: {
    ${hostname} = inputs.nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      specialArgs = mkArgs hostname "sam" "home";
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
}
