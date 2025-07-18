{...}: {
  imports = [
    ./btop.nix
    ./direnv.nix
    ./ghostty
    ./git.nix
    ./home.nix
    ./packages.nix
    ./shell
    ./tmux.nix
    ./vscode
    ./xournalpp
    ./zed
  ];
  fonts.fontconfig.enable = true;
  nixpkgs.config.allowUnfree = true;
}
