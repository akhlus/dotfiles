{config, pkgs, ...}: {
  services.displayManager.sddm.enable = !config.nMods.de.enableJovian;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  environment.systemPackages = with pkgs; [
    kdePackages.partitionmanager
  ];
}
