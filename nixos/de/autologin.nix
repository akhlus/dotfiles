{
  config,
  username,
  ...
}: let
  cfg = config.nMods.de;
  isGnome = cfg.environment == "gnome";
in {
  services.displayManager.autoLogin = {
    enable = cfg.enableAutoLogin;
    user = username;
  };
  systemd.services = {
    "getty@tty1".enable = isGnome;
    "autov@tty1".enable = isGnome;
  };
}
