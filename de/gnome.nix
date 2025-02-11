{
  pkgs,
  pkgs-stable,
  userSettings,
  ...
}: {
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.power-profiles-daemon.enable = true;

  #enable dconf config
  home-manager.users.${userSettings.name}.imports = [./dconf.nix];

  environment.systemPackages =
    [pkgs.gnome-tweaks]
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
