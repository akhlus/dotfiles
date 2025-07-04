{config, ...}: {
  jovian = {
    decky-loader.enable = true;
    decky-loader.user = "sam";
    devices.steamdeck.enable = true;
    steam = {
      autoStart = config.nMods.de.autoStartJovian;
      user = "sam";
      desktopSession = config.nMods.de.environment;
      enable = true;
      updater.splash = "vendor";
    };
    hardware.has.amd.gpu = true;
    steamos = {
      useSteamOSConfig = true;
    };
  };
}
