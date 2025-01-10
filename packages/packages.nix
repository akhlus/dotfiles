{ config, pkgs, pkgs-stable, systemSettings, userSettings, ... }:
{
  imports = [
    (if userSettings.de=="gnome" then ./gnome.nix else null)
    ./cli.nix
  ];
  environment.systemPackages =
  (with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #apps
  anki
  brave
  calibre
  chromium
  dconf-editor
  firefox
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
  inter
  source-code-pro
  fira
  ]);
}
