{
  config,
  lib,
  ...
}: let
  cfg = config.customModules.de;
in {
  options.customModules.de = {
    enable = lib.mkEnableOption "Enable graphics" // {default = true;};
    environment = lib.mkOption {
      type = lib.types.enum ["gnome" "kde" "cosmic" "jovian"];
      default = "gnome";
      description = "Environment choice";
    };
    enableJovian = lib.mkEnableOption "Enable Jovian" // {default = false;};
  };
  config = lib.mkIf cfg.enable {
    imports = [
      (
        if cfg.enableJovian
        then ./jovian.nix
        else ./${cfg.environment}.nix
      )
    ];
  };
}
