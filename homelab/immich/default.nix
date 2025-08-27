{
  config,
  lib,
  ...
}: let
  cfg = config.homelab;
in {
  options.homelab = {
    enableImmich = lib.mkEnableOption "Enable Immich" // {default = cfg.enableHomelab;};
  };
  config = (lib.mkIf cfg.enableImmich) {
    programs.immich = {
      enable = true;
    };
  };
}
