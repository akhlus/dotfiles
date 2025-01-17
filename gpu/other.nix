#other graphics options go here
{
  config,
  lib,
  pkgs,
  ...
}: {
  services.tlp.enable = true;
  services.power-profiles-daemon.enable = false;
  powerManagement.powertop.enable = true;
}
