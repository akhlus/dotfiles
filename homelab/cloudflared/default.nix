{
  config,
  lib,
  ...
}: let
  cfg = config.homelab;
in {
  options.homelab = {
    enableCloudflared = lib.mkEnableOption "Enable Cloudflared" // {default = cfg.enableHomelab;};
  };
  config = (lib.mkIf cfg.enableCloudflared) {
    services.cloudflared = {
      enable = true;
    };
  };
}
