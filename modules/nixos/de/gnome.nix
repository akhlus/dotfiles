{
  config,
  lib,
  pkgs,
  userName,
  ...
}: {
  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = !config.customModules.de.enableJovian;
  services.desktopManager.gnome.enable = true;
  services.power-profiles-daemon.enable = lib.mkDefault true;

  #enable dconf config
  home-manager.users.${userName}.imports = [./dconf.nix];

  environment.systemPackages =
    (with pkgs; [
      gnome-tweaks
      dconf2nix
      dconf-editor
      gnome-extension-manager
    ])
    ++ (with pkgs.gnomeExtensions; [
      appindicator
      blur-my-shell
      caffeine
      clipboard-indicator
      dash-to-dock
      dash-to-panel
    ]);

  environment.gnome.excludePackages = with pkgs; [
    gnome-backgrounds
    totem #video player
  ];
}
