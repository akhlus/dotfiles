{
  config,
  flakePath,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hMods.zed;
in {
  options.hMods.zed = {
    enable = lib.mkEnableOption "Enable Zed" // {default = true;};
    package = lib.mkPackageOption pkgs "zed-editor" {
      nullable = true;
    };
  };
  config = lib.mkIf cfg.enable {
    home.file = {
      ".config/zed/themes/akhlus.json".source = ./files/akhlus.json;
      ".config/zed/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${flakePath}/modules/hm/files/zed-settings.json";
    };
    programs.zed-editor = {
      enable = cfg.enable;
      package = cfg.package;
    };
  };
}
