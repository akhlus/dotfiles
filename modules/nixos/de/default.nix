{
  config,
  lib,
  pkgs,
  userName,
  ...
}: let
  auto = import ./autologin.nix {inherit config userName;};
  cfg = config.nMods.de;
  cosmic = import ./cosmic.nix {inherit config;};
  gnome = import ./gnome.nix {inherit config lib pkgs userName;};
  jovian = import ./jovian.nix {inherit config userName;};
  plasma = import ./plasma.nix {inherit config pkgs;};
in {
  options.nMods.de = {
    enable = lib.mkEnableOption "Enable graphics" // {default = true;};
    environment = lib.mkOption {
      type = lib.types.enum ["gnome" "plasma" "cosmic"];
      default = "gnome";
      description = "Environment choice";
    };
    enableJovian = lib.mkEnableOption "Enable Jovian - SteamOS equivalent" // {default = false;};
    enableAutoStartJovian = lib.mkEnableOption "Enable Autostart for Jovian" // {default = config.nMods.de.enableJovian;};
    enableAutoLogin = lib.mkEnableOption "Enable Auto Login";
  };
  config = lib.mkIf cfg.enable (lib.mkMerge [
    (lib.mkIf cfg.enableJovian jovian)
    (lib.mkIf (cfg.environment == "gnome") gnome)
    (lib.mkIf (cfg.environment == "plasma") plasma)
    (lib.mkIf (cfg.environment == "cosmic") cosmic)
    (lib.mkIf cfg.enableAutoLogin auto)
    {services.gnome.gnome-keyring.enable = lib.mkForce true;}
  ]);
}
