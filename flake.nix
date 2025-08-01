{
  description = "NixOS configuration";
  inputs = {
    jovian = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-stable = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nixgl.url = "github:nix-community/nixGL";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };
  outputs = inputs @ {self, ...}: let
    helpers = import ./flakeHelpers.nix inputs;
    inherit (helpers) mkDarwin mkNixos mkStable mkHome mkMerge;
  in
    mkMerge [
      (mkDarwin "mba")
      (mkNixos "a3")
      (mkNixos "s340")
      (mkNixos "deck")
      (mkNixos "hp")
      (mkNixos "duet3i")
      (mkHome "deck" "x86_64-linux" "home-deck")
      (mkHome "sam" "aarch64-linux" "penguin")
    ];
}
