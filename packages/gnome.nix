{
  config,
  pkgs,
  pkgs-stable,
  ...
}: {
  # Enable the GNOME Desktop Environment.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages =
    (with pkgs; [
      gparted
      nautilus
      nautilus-open-any-terminal
    ])
    ++ (with pkgs.gnomeExtensions; [
      appindicator
      blur-my-shell
      caffeine
      clipboard-indicator
      dash-to-panel
      dash-to-dock
    ])
    ++ (with pkgs-stable; [
      gnome-extension-manager
    ]);
}
