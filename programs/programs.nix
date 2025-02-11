{pkgs, ...}:{
  imports = [
    ./bash.nix
    ./btop.nix
    ./git.nix
    ./vscode.nix
    ./xournalpp.nix
  ];

  home.packages = with pkgs; [
    alejandra
    brave
    fastfetch
    firefox
    gh
    gnome-keyring
    nano
    seahorse
    tldr
    ungit
    unzip
    wget
    vlc
  ];
}
