{config, ...}: {
  jovian = {
    decky-loader.enable = true;
    decky-loader.user = "sam";
    devices.steamdeck.enable = true;
    steam = {
      autoStart = true;
      user = "sam";
      desktopSession = config.customModules.de;
      enable = true;
      updater.splash = "vendor";
    };
    hardware.has.amd.gpu = true;
    steamos = {
      useSteamOSConfig = true;
    };
  };
}
