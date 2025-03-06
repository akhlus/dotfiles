{pkgs, ...}: {
  #packages for darwin
  home.packages = with pkgs; [
    anki
    calibre
    ffmpeg
    google-chrome
    home-manager
    hwinfo
    jdk
    kicad-small
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
    ruff
    speedtest-cli
    spotify
    usbutils
    wireguard-tools
  ];
}
