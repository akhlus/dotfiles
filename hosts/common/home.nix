{settings, ...}: {
  imports = [];

  home.username = "${settings.name}";
  home.homeDirectory = "/${settings.home}/${settings.name}";

  home.file = {
    "Pictures/background.jpg".source = ./../../programs/files/tignes.jpg;
  };

  home.sessionVariables = {
    FLAKE_PATH = "${settings.flakePath}";
  };

  home.stateVersion = "24.11"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree = true;
}
