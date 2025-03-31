{
  lib,
  pkgs,
  config,
  ...
}: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 5;
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
    plymouth = {
      enable = true;
      theme = lib.mkDefault "bgrt";
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "v4l2loopback" ];
    extraModulePackages = [ config.boot.kernelPackages.v4l2loopback ];
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "splash"
      "quiet"
      "boot.shell_on_fail"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
  };
}
