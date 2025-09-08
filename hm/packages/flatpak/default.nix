{
  config,
  lib,
  ...
}: let
  cfg = config.hMods.packages.flatpak;
in {
  options.hMods.packages.flatpak = {
    enable = lib.mkEnableOption "Enable flatpak" // {default = false;};
  };
  config = lib.mkIf cfg.enable {
    services.flatpak = {
      update.auto.enable = true;
      uninstallUnmanaged = true;
      packages = [
        "com.brave.Browser"
        "com.spotify.Client"
        "com.discordapp.Discord"
      ];
    };
  };
}
