{ config, pkgs, pkgs-stable, systemSettings, userSettings, ... }:
{
  environment.systemPackages =
  (with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #apps
  anki
  brave
  calibre
  cargo
  chromium
  dconf2nix
  dconf-editor
  fastfetch
  ffmpeg
  firefox
  fwupd
  gh
  git
  gnome-tweaks
  google-chrome
  gparted
  home-manager
  htop
  jdk
  kicad-small
  kiwix
  libgcc
  lm_sensors
  lshw
  nil
  nixd
  nodejs_latest
  onlyoffice-bin_latest
  pciutils
  pipx
  protonvpn-gui
  python3Full
  python3Packages.python-lsp-server
  qbittorrent
  ruff-lsp
  rustup
  speedtest-cli
  spotdl
  spotify
  tio
  tldr
  ungit
  usbutils
  ventoy-full
  vlc
  vscode-fhs
  vscodium-fhs
  wget
  wireguard-tools
  xournalpp
  yt-dlg
  yt-dlp
  zed-editor



  #extensions
  gnomeExtensions.caffeine
  gnomeExtensions.blur-my-shell
  gnomeExtensions.dash-to-panel
  gnomeExtensions.dash-to-dock
  gnomeExtensions.appindicator
  gnomeExtensions.clipboard-indicator

  #typefaces
  inter
  source-code-pro
  fira
  ])
  ++
  (with pkgs-stable; [
  gnome-extension-manager
  ]);
}
