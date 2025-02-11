{userSettings, ...}: {
  imports = [
    ./../../programs/programs.nix
    ./../../programs/stylix.nix
  ];
  nixpkgs.config.allowUnfree = true;
  home.username = "${userSettings.name}";
  home.homeDirectory = "/home/${userSettings.name}";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.file = {
    ".local/share/backgrounds/tignes.jpg".source = ./../../programs/files/tignes.jpg;
  };
}
