{pkgs, ...}: {
  imports = [
    ./bash.nix
    ./btop.nix
    ./ghostty.nix
    ./git.nix
    ./vscode.nix
    ./xournalpp.nix
    ./zed.nix
    ./zsh.nix
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    alejandra
    brave
    fastfetch
    ffmpeg
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
    wget
    wireguard-tools
    wireguard-ui
  ];
}
