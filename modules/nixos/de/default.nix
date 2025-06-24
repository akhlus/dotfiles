{
  config,
  lib,
  pkgs,
  userName,
  ...
}: let
  cfg = config.customModules.de;
  gnome = import ./gnome.nix {inherit config lib pkgs userName;};
  plasma = import ./plasma.nix {inherit config;};
  cosmic = import ./cosmic.nix {inherit config;};
  jovian = import ./jovian.nix {inherit config;};
in {
  options.customModules.de = {
    enable = lib.mkEnableOption "Enable graphics" // {default = true;};
    environment = lib.mkOption {
      type = lib.types.enum ["gnome" "plasma" "cosmic"];
      default = "gnome";
      description = "Environment choice - for jovian";
    };
    enableJovian = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Jovian";
    };
  };
  config = lib.mkIf cfg.enable (lib.mkMerge [
    (lib.mkIf cfg.enableJovian jovian)
    (lib.mkIf (cfg.environment == "gnome") gnome)
    (lib.mkIf (cfg.environment == "plasma") plasma)
    (lib.mkIf (cfg.environment == "cosmic") cosmic)
  ]);
}
