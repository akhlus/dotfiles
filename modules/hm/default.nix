{settings,...}:{
  imports = [
    (if settings.de == "apple"
      then ./darwin.nix
      else ./linux.nix)
    ./packages.nix
  ];

  home.file = {
    "Pictures/background.jpg".source = ./files/tignes.jpg;
  };

  home.sessionVariables = {
    FLAKE_PATH = "${settings.flakePath}";
  };

  home.stateVersion = "24.11";
  nixpkgs.config.allowUnfree = true;
}
