{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.homelab;
in {
  options.homelab = {
    enableJellyfin = lib.mkEnableOption "Enable Jellyfin" // {default = cfg.enableHomelab;};
  };
  config = (lib.mkIf cfg.enableJellyfin) {
    services.jellyfin = {
      enable = true;
      dataDir = "/var/lib/jellyfin";
      user = cfg.user;
      group = cfg.group;
    };
    environment.systemPackages = with pkgs; [
      jellyfin
      jellyfin-ffmpeg
    ];
  };
}
