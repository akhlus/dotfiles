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
    enableJovian = lib.mkOption {
      type = lib.types.boolean;
      default = false;
      description = "Enable Jovian";
    };
  };
  imports = lib.mkIf cfg.enable [
    (
      if cfg.enableJovian
      then ./jovian.nix
      else ./${cfg.environment}.nix
    )
  ];
}
