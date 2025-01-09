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
        system = "x86_64-linux";
        hostname = "desktop";
        timezone = "Europe/London";
        locale = "en_GB.UTF-8";
        gpu = "amd";
      };
      gpu = (if (systemSettings.gpu == "nvidia") then ./gpu/nvidia.nix else ./gpu/other.nix);
      pkgs=nixpkgs.legacyPackages.${systemSettings.system};
      pkgs-stable = nixpkgs-stable.legacyPackages.${systemSettings.system};
      lib=nixpkgs.lib;
    in {
      nixosConfigurations."def" = lib.nixosSystem {
        system = systemSettings.system;
        modules = [
          ./configuration.nix
        ]++gpu;
        specialArgs = {
          inherit pkgs-stable;
        };
      };
      homeConfigurations={
        sam=home-manager.lib.homeManagerConfiguration{
          inherit pkgs;
          modules=[./home.nix];
        };
      };
    };
}
