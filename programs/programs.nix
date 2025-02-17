{pkgs, ...}: {
  imports = [
    ./bash.nix
    ./btop.nix
    ./ghostty.nix
    ./git.nix
    ./vscode.nix
    ./xournalpp.nix
    ./zed.nix
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
