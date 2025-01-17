{
  config,
  pkgs,
  pkgs-stable,
  userSettings,
  ...
}: {
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  #enable dconf config
  home-manager.users.${userSettings.name}.imports = [./../de/dconf.nix];

  environment.systemPackages =
    (with pkgs; [
      nautilus
      nautilus-open-any-terminal
      gnome-tweaks
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
