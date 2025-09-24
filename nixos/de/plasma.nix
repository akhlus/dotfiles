{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.nMods.de;
in {
  config = lib.mkIf (cfg.environment == "plasma") {
    services.displayManager.sddm.enable = !cfg.enableJovian;
    services.displayManager.sddm.wayland.enable = true;
    services.desktopManager.plasma6.enable = true;
    environment.systemPackages = with pkgs; [
      kdePackages.partitionmanager
      maliit-keyboard
    ];
  };
}
