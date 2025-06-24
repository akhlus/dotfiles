{inputs, lib, ...}: {
  imports = [ inputs.jovian.nixosModules.default ];
  jovian = {
    decky-loader.enable = false;
    decky-loader.user = "sam";
    devices.steamdeck.enable = true;
    steam = {
      autoStart = true;
      user = "sam";
      desktopSession = "gnome";
      enable = true;
      updater.splash = "vendor";
    };
    hardware.has.amd.gpu = true;
    steamos = {
      useSteamOSConfig = true;
    };
  };
  services.displayManager.sddm.enable = lib.mkForce false;
}
