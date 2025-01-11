{
  config,
  pkgs,
  pkgs-stable,
  systemSettings,
  userSettings,
  ...
}:
{
  imports = [
    ./cli.nix
    ./${systemSettings.use}.nix
  ];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
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
    gnome-tweaks
    google-chrome
    kicad-small
    kiwix
    onlyoffice-bin_latest
    protonvpn-gui
    qbittorrent
    spotify
    vlc
    vscode-fhs
    vscodium-fhs
    xournalpp
    yt-dlg
    zed-editor

    #typefaces
    fira
    inter
    source-code-pro
  ];
}
