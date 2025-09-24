{
  config,
  lib,
  pkgs,
  username,
  ...
}: let
  cfg = config.nMods.de;
in {
  config = lib.mkIf (cfg.environment == "gnome") {
    services = {
      displayManager.gdm.enable = !config.nMods.de.enableJovian;
      desktopManager.gnome.enable = true;
      power-profiles-daemon.enable = lib.mkDefault true;
      gnome.gnome-keyring.enable = true;
    };

    #enable dconf config
    home-manager.users.${username}.imports = [./dconf.nix];

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
        tiling-shell
      ]);

    environment.gnome.excludePackages = with pkgs; [
      gnome-backgrounds
      totem #video player
    ];
  };
}
