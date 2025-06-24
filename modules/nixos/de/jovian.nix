{
  config,
  ...
}: {
  jovian = {
    decky-loader.enable = false;
    decky-loader.user = "sam";
    devices.steamdeck.enable = true;
    steam = {
      autoStart = true;
      user = "sam";
      desktopSession = config.nixosModules.de.environment;
      enable = true;
      updater.splash = "vendor";
    };
    hardware.has.amd.gpu = true;
    steamos = {
      useSteamOSConfig = true;
    };
  };
}
