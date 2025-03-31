{
  pkgs,
  settings,
  ...
}: {
  home.username = "${settings.username}";
  home.homeDirectory = "/home/${settings.username}";

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
    vlc
  ];

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.afterglow-cursors-recolored;
    name = "Afterglow-Recolored-Catppuccin-Macchiato";
    size = 24;
  };

}
