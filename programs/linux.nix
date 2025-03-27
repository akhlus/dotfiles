{
  pkgs,
  settings,
  ...
}: {
  home.homeDirectory = "/home/${settings.name}";
  #packages that aren't needed on chromeos but are on any other linux system
  home.packages = with pkgs; [
    anki
    calibre
    chromium
    dconf2nix

    dconf-editor

    fwupd

    gparted

    kicad-small
    kiwix
    lshw
    hwinfo

    onlyoffice-bin_latest

    pipx
    powertop
    protonvpn-gui

    qbittorrent
    qmk
    quarto

    spotdl

    tlp

    ventoy
    vial
  ];

  #cursor config for linux systems
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.afterglow-cursors-recolored;
    name = "Afterglow-Recolored-Catppuccin-Macchiato";
    size = 24;
  };
}
