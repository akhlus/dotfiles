{
  description = "NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    ...
  }: let
    systemSettings = {
      hostname = "desktop";
      gpu = "nvidia"; #nvidia or other for now
      de = "gnome";
      use = "game"; #game or work
      system = "x86_64-linux";
      timezone = "Europe/London";
      locale = "en_GB.UTF-8";
    };
    userSettings = rec {
      name = "sam"; #for account
      username = "akhlus"; #for git
      email = "samuellarcombe@gmail.com";
      flakePath = "/home/${name}/.dotfiles";
    };
    pkgs = nixpkgs.legacyPackages.${systemSettings.system};
    pkgs-stable = nixpkgs-stable.legacyPackages.${systemSettings.system};
    lib = nixpkgs.lib;
  in {
    nixosConfigurations."system" = lib.nixosSystem {
      system = systemSettings.system;
      modules = [
        ./configuration.nix
        (./gpu + "/${systemSettings.gpu}.nix")
      ];
      specialArgs = {
        inherit pkgs-stable;
        inherit systemSettings;
        inherit userSettings;
      };
    };
    homeConfigurations = {
      user = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [./home.nix];
        extraSpecialArgs = {
          inherit systemSettings;
          inherit userSettings;
          inherit pkgs-stable;
        };
      };
    };
  };
}
