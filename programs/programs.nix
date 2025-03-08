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
    #firefox
    gh
    inter
    mpv
    nano
    source-code-pro
    tldr
    ungit
    unzip
    wget
  ];
}
