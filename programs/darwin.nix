{pkgs, ...}: {
  #packages for darwin
  home.packages = with pkgs; [
    ffmpeg
    home-manager
    jdk
    nixd
    nix-search-cli
    pandoc
    pciutils
    pipx
    python3
    python3Packages.python-lsp-server
    ruff
    speedtest-cli
    wireguard-tools
  ];
}
