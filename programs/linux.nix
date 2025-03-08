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
    dconf2nix
    chromium
    dconf-editor
    ffmpeg
    fwupd
    google-chrome
    gparted
    home-manager
    hwinfo
    jdk
    kicad-small
    kiwix
    lshw
    nixd
    nix-search-cli
    onlyoffice-bin_latest
    pandoc
    pciutils
    pipx
    powertop
    protonvpn-gui
    python3
    python3Packages.python-lsp-server
    qbittorrent
    qmk
    quarto
    ruff
    speedtest-cli
    spotdl
    spotify
    tlp
    usbutils
    ventoy
    vial
    wireguard-tools
    yt-dlp
    yt-dlg
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
