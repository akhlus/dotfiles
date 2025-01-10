{
  description = "NixOS configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url="github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    ...
  }:
    let
      systemSettings = {
        hostname = "hp";
        gpu = "other"; #nvidia or other for now
        system = "x86_64-linux";
        timezone = "Europe/London";
        locale = "en_GB.UTF-8";
      };
      userSettings = {
        name = "sam"; #for account
        username = "akhlus"; #for git
        email = "samuellarcombe@gmail.com";
        de = "gnome";
      };
      pkgs=nixpkgs.legacyPackages.${systemSettings.system};
      pkgs-stable = nixpkgs-stable.legacyPackages.${systemSettings.system};
      lib=nixpkgs.lib;
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
      homeConfigurations={
        user=home-manager.lib.homeManagerConfiguration{
          inherit pkgs;
          modules=[./home.nix];
        };
      };
    };
}
