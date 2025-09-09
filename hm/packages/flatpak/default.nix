{
  config,
  lib,
  ...
}: let
  cfg = config.hMods.packages.flatpak;
in {
  options.hMods.packages.flatpak = {
    enable = lib.mkEnableOption "flatpak";
    enableDefaultApps = lib.mkEnableOption "default apps for flatpak (brave, discord, spotify)";
    extraApps = lib.mkOption {
      default = [];
      example = ["com.brave.Browser"];
      description = "List of extra apps to install from flatpak";
      type = lib.types.listOf lib.types.str;
    };
  };
  config = lib.mkIf cfg.enable {
    services.flatpak = {
      update.auto.enable = true;
      uninstallUnmanaged = true;
      packages =
        (lib.optionals cfg.enableDefaultApps [
          "com.brave.Browser"
          "com.discordapp.Discord"
          "com.spotify.Client"
        ])
        ++ cfg.extraApps;
    };
  };
}
