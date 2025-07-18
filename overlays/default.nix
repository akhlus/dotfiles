{...}: {
  nixpkgs.overlays = [
    (import ./symbola.nix)
    (import ./clisp.nix)
  ];
}
