{
  config,
  pkgs,
  pkgs-stable,
  systemSettings,
  userSettings,
  ...
}: {
  imports = [
    ./cli.nix
    ./${systemSettings.use}.nix
  ];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  fonts.packages = with pkgs; [
    fira-code-symbols
    nerd-fonts.fira-code
    nerd-fonts.zed-mono
  ];
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #apps
    anki
    brave
    calibre
    chromium
    dconf-editor
    firefox
    ghostty
    google-chrome
    gparted
    gnome-keyring
    kicad-small
    kiwix
    onlyoffice-bin_latest
    protonvpn-gui
    qbittorrent
    seahorse
    spotify
    vial
    vlc
    vscode-fhs
    vscodium-fhs
    xournalpp
    yt-dlg
    zed-editor
  ];
}
