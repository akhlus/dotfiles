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
  services.gnome-keyring.enable = true;

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    alejandra
    brave
    fastfetch
    firefox
    gh
    gnome-keyring
    inter
    nano
    seahorse
    source-code-pro
    tldr
    ungit
    unzip
    wget
    vlc
  ];
}
