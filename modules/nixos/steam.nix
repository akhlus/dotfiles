{
  config,
  lib,
  ...
}: let
  cfg = config.customModules.steam;
in {
  options.customModules.steam = {
    enable = lib.mkEnableOption "Enable Steam" // {default = false;};
  };
  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = cfg.enable;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
  };
}
