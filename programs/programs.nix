{pkgs, ...}: {
  imports = [
    ./btop.nix
    ./ghostty.nix
    ./git.nix
    ./shell.nix
    ./vscode.nix
    ./xournalpp.nix
    ./zed.nix
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    alejandra
    brave
    fastfetch
    ffmpeg
    firefox
    gh
    google-chrome
    home-manager
    inter
    jdk
    mpv
    nano
    nix-search-cli
    nixd
    pandoc
    pciutils
    python3
    python3Packages.python-lsp-server
    ruff
    source-code-pro
    speedtest-cli
    spotify
    tldr
    ungit
    unzip
    usbutils
    wget
    wireguard-tools
    wireguard-ui
    xournalpp
    yt-dlp
    yt-dlg
  ];
}
