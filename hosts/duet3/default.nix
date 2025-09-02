{pkgs, ...}: {
  mobile.boot.boot-control.enable = false;
  mobile.beautification.splash = true;
  hardware.firmware = [
    pkgs.chromeos-sc7180-unredistributable-firmware
  ];
  nMods = {
    de = {
      environment = "gnome";
      enableAutoLogin = true;
    };
    boot.enable = false;
  };
}
