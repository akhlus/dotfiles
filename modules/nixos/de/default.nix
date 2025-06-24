{
  config,
  inputs,
  lib,
  pkgs,
  userName,
  ...
}: let
  cfg = config.customModules.de;
  gnome = import ./gnome.nix {inherit lib pkgs userName;};
  kde = import ./kde.nix {};
  cosmic = import ./cosmic.nix {};
  jovian = import ./jovian.nix {inherit config inputs;};
in {
  options.customModules.de = {
    enable = lib.mkEnableOption "Enable graphics" // {default = true;};
    environment = lib.mkOption {
      type = lib.types.enum ["gnome" "kde" "cosmic"];
      default = "gnome";
      description = "Environment choice - for jovian";
    };
    enableJovian = lib.mkOption {
      type = lib.types.boolean;
      default = false;
      description = "Enable Jovian";
    };
  };
  config = lib.mkIf cfg.enable (lib.mkMerge[
    (lib.mkIf cfg.enableJovian jovian)
    (lib.mkIf (!cfg.enableJovian && cfg.environment == "gnome") gnome)
    (lib.mkIf (!cfg.enableJovian && cfg.environment == "kde") kde)
    (lib.mkIf (!cfg.enableJovian && cfg.environment == "cosmic") cosmic)
  ]);
}
