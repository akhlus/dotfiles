{
  config,
  lib,
  ...
}: let
  cfg = config.homelab;
in {
  options.homelab = {
    enableAudiobookshelf = lib.mkEnableOption "Enable Audiobookshelf" // {default = cfg.enableHomelab;};
  };
  config = (lib.mkIf cfg.enableAudiobookshelf) {
    services.audiobookshelf = {
      enable = true;
      user = cfg.user;
      group = cfg.group;
      dataDir = "Audiobook";
    };
  };
}
