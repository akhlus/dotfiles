{
  flakePath,
  isDarwin,
  ...
}: {
  imports = [
    (
      if isDarwin
      then ./darwin.nix
      else ./linux.nix
    )
    ./packages.nix
  ];

  home.file = {
    "Pictures/background.jpg".source = ./files/tignes.jpg;
  };

  home.sessionVariables = {
    FLAKE_PATH = "${flakePath}";
  };

  home.stateVersion = "24.11";
  nixpkgs.config.allowUnfree = true;
}
