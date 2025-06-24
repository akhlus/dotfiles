{
  pkgs,
  userName,
  ...
}: {
  home.username = "${userName}";
  home.homeDirectory = "/home/${userName}";

  home.packages = with pkgs; [
    anki
    chromium
    fwupd
    hwinfo
    libreoffice
    lshw
    powertop
    protonvpn-gui
    qmk
    spotdl
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
