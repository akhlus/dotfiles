{config, pkgs, ...}:
{
  environment.systemPackages =
  (with pkgs; [
  dconf2nix
  fastfetch
  ffmpeg
  fwupd
  gh
  git
  home-manager
  htop
  hwinfo
  jdk
  libgcc
  lm_sensors
  lshw
  nil
  nixd
  pandoc
  pciutils
  pipx
  python3Full
  python3Packages.python-lsp-server
  ruff-lsp
  speedtest-cli
  spotdl
  tldr
  tlp
  ungit
  unzip
  usbutils
  ventoy
  wget
  wireguard-tools
  yt-dlp
  ]);
}
