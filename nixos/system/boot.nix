{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.nMods.boot;
in {
  options.nMods.boot = {
    enable = lib.mkEnableOption "Enable Boot Options" // {default = true;};
  };
  config = lib.mkIf cfg.enable {
    boot = {
      binfmt.emulatedSystems = ["aarch64-linux"];
      consoleLogLevel = 0;
      extraModulePackages = [config.boot.kernelPackages.v4l2loopback];
      initrd.verbose = false;
      kernelModules = ["v4l2loopback"];
      kernelPackages = pkgs.linuxPackages_latest;
      kernelParams = [
        "splash"
        "quiet"
        "boot.shell_on_fail"
        "rd.systemd.show_status=false"
        "rd.udev.log_level=3"
        "udev.log_priority=3"
      ];
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
    };
  };
}
