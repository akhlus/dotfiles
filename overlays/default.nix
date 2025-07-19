{...}: {
  nixpkgs.overlays = [
    (import ./symbola.nix)
  ];
}
