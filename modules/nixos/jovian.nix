{lib, ...}: {
  jovian = {
    decky-loader.enable = true;
    decky-loader.user = "sam";
    devices.steamdeck.enable = true;
    steam = {
      autoStart = true;
      user = "sam";
      desktopSession = "plasma6";
    };
    hardware.has.amd.gpu = true;
  };
  services.displayManager.sddm.enable = lib.mkForce false;
}
