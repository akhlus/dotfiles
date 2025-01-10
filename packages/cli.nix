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
  jdk
  libgcc
  lm_sensors
  lshw
  nixd
  pciutils
  pipx
  python3
  python3Packages.python-lsp-server
  ruff-lsp
  speedtest-cli
  spotdl
  tldr
  ungit
  usbutils
  ventoy
  wget
  wireguard-tools
  yt-dlp
  ]);
}
