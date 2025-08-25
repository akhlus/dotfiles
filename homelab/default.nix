{
  config,
  lib,
  ...
}: let
  cfg = config.homelab;
in {
  options.homelab = {
    enableHomelab = lib.mkEnableOption "Enable homelab stuff" // {default = false;};
    user = lib.mkOption {
      default = "share";
      type = lib.types.str;
      description = "User to run homelab services as";
    };
    group = lib.mkOption {
      default = "share";
      type = lib.types.str;
      description = "Group to run homelab services as";
    };
  };
  config = (lib.mkIf cfg.enableHomelab) {
    users = {
      groups.${cfg.group} = {
        gid = 993;
      };
      users.${cfg.users} = {
        uid = 994;
        isSystemUser = true;
        group = cfg.group;
      };
    };
  };
}
