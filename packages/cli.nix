{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    dconf2nix
    fastfetch
    ffmpeg
    fwupd
    gh
    git
    home-manager
    htop
    hwinfo
    jdk
    libgcc
    lm_sensors
    lshw
    nil
    nixd
    nix-search-cli
    pandoc
    pciutils
    pipx
    powertop
    python3Full
    python3Packages.numpy
    python3Packages.python-lsp-server
    qmk
    quarto
    ruff
    speedtest-cli
    spotdl
    tldr
    tlp
    ungit
    unzip
    usbutils
    ventoy
    wget
    wireguard-tools
    yt-dlp
  ];
}
