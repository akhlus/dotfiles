{
  config,
  userName,
  ...
}: let
  cfg = config.nMods.de;
  isGnome = cfg.environment == "gnome";
in {
  services.displayManager.autoLogin = {
    enable = cfg.enableAutoLogin;
    user = userName;
  };
  systemd.services = {
    "getty@tty1".enable = isGnome;
    "autov@tty1".enable = isGnome;
  };
}
