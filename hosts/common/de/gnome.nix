{
  pkgs,
  pkgs-stable,
  settings,
  ...
}: {
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.power-profiles-daemon.enable = true;

  #enable dconf config
  home-manager.users.${settings.name}.imports = [./dconf.nix];

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

  environment.gnome.excludePackages = with pkgs; [
    gnome-backgrounds
    totem #video player
  ];
}
