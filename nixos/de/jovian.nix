{
  config,
  username,
  ...
}: let
  cfg = config.nMods.de;
in {
  jovian = {
    decky-loader.enable = true;
    decky-loader.user = username;
    devices.steamdeck.enable = true;
    steam = {
      autoStart = cfg.autoStartJovian;
      user = "sam";
      desktopSession = cfg.environment;
      enable = true;
      updater.splash = "vendor";
    };
    hardware.has.amd.gpu = true;
    steamos = {
      useSteamOSConfig = true;
    };
  };
}
