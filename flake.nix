{
  description = "NixOS configuration";
  outputs = inputs @ {self, ...}: let
    helpers = import ./flakeHelpers.nix inputs;
    inherit (helpers) mkDarwin mkNixos mkMerge;
  in
    mkMerge [
      (mkDarwin "mba")
      (mkNixos "a3")
      (mkNixos "s340")
      (mkNixos "deck")
      (mkNixos "hp")
    ];
  inputs = {
    jovian = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };
}
