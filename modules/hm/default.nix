{...}: {
  imports = [
    ./btop.nix
    ./ghostty.nix
    ./git.nix
    ./home.nix
    ./packages.nix
    ./shell.nix
    ./tmux.nix
    ./vscode.nix
    ./xournalpp.nix
    ./zed.nix
  ];
  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;
}
