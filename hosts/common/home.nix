{
  pkgs,
  settings,
  ...
}: {
  imports = [
    ../../programs/programs.nix
  ];

  home.username = "${settings.name}";
  home.homeDirectory = "/${settings.home}/${settings.name}";

  home.file = {
    "Pictures/background.jpg".source = ../../programs/files/tignes.jpg;
  };

  home.packages = with pkgs; [
    anki
    #calibre
    chromium
    fwupd
    #kicad-small
    hwinfo
    libreoffice
    lshw
    powertop
    protonvpn-gui
    #qbittorrent
    qmk
    spotdl
    ventoy
    vial
  ];

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.afterglow-cursors-recolored;
    name = "Afterglow-Recolored-Catppuccin-Macchiato";
    size = 24;
  };

  home.sessionVariables = {
    FLAKE_PATH = "${settings.flakePath}";
  };

  home.stateVersion = "24.11";
  nixpkgs.config.allowUnfree = true;
}
