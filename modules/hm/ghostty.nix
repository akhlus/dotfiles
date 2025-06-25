{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hMods.ghostty;
in {
  options.hMods.ghostty = {
    enable = lib.mkEnableOption "Enable Ghostty" // {default = true;};
    package = lib.mkPackageOption pkgs "ghostty" {
      nullable = true;
    };
  };
  config = lib.mkIf cfg.enable {
    home.file = {
      ".config/ghostty/themes/akhlus".source = ./files/ghostty.theme;
      ".config/ghostty/config".source = ./files/ghostty-config;
    };
    programs.ghostty = {
      enable = cfg.enable;
      package = cfg.package;
    };
  };
}
