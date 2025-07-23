{
  config,
  flakePath,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hMods.packages.zed;
  theme = (import ./theme.nix {inherit config lib;}).themeOut;
in {
  options.hMods.packages.zed = {
    enable = lib.mkEnableOption "Enable Zed" // {default = config.hMods.enableMinimal;};
    package = lib.mkPackageOption pkgs "zed-editor" {
      nullable = false;
    };
  };
  config = lib.mkIf cfg.enable {
    home.file = {
      ".config/zed/themes/akhlus.json".text = theme;
      ".config/zed/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${flakePath}/hm/packages/zed/zed-settings.json";
    };
    programs.zed-editor = {
      enable = cfg.enable;
      package = cfg.package;
    };
  };
}
