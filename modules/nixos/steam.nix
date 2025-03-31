{settings, ...}: {
  programs.steam = {
    enable = settings.enableSteam;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
