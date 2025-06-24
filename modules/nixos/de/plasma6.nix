{config, ...}: {
  services.displayManager.sddm.enable = !config.customModules.de.enableJovian;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
}
