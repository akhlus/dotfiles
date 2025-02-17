{settings, ...}: {
  imports = [
    ./../../programs/programs.nix
  ];
  nixpkgs.config.allowUnfree = true;
  home.username = "${settings.name}";
  home.homeDirectory = "/home/${settings.name}";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.file = {
    "Pictures/background.jpg".source = ./../../programs/files/tignes.jpg;
  };
}
