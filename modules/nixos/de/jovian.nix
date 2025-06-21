{...}: {
  jovian = {
    decky-loader.enable = true;
    decky-loader.user = "sam";
    devices.steamdeck.enable = true;
    steam = {
      autoStart = true;
      user = "sam";
      desktopSession = "gnome";
    };
    hardware.has.amd.gpu = true;
  };
}
