{
  config,
  lib,
  settings,
  ...
}:
lib.mkIf (settings.gpu == "nvidia") {
  hardware.graphics = {
    enable = true;
  };
  services.xserver.videoDrivers = ["nvidia"];
  powerManagement.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };
}
