{config, pkgs, ...}:
{
  environment.systemPackages =
  (with pkgs.gnomeExtensions;
  [
    caffeine
    blur-my-shell
    dash-to-panel
    dash-to-dock
    appindicator
    clipboard-indicator
  ])  ++
  (with pkgs-stable;
  [
    gnome-extension-manager
  ]);

}
