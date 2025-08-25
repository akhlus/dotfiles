{
  config,
  lib,
  ...
}: let
  cfg = config.homelab;
in {
  options.homelab = {
    enableCalibre = lib.mkEnableOption "Enable Calibre" // {default = cfg.enableHomelab;};
  };
  config = (lib.mkIf cfg.enableCalibre) {
    services = {
      calibre-web = {
        enable = true;
        user = cfg.user;
        group = cfg.group;
        dataDir = "CalibreLibrary";
      };
      calibre-server = {
        enable = true;
        user = cfg.user;
        group = cfg.group;
        libraries = ["/var/lib/CalibreLibrary"];
      };
    };
  };
}
