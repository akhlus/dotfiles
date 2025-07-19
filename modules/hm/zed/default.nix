{
  config,
  flakePath,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hMods.zed;
  replacements = import ./replacements.nix;
  template = builtins.readFile ./template.json;
  theme = lib.replaceStrings (map (r: r.from) replacements) (map (r: r.to) replacements) template;
in {
  options.hMods.zed = {
    enable = lib.mkEnableOption "Enable Zed" // {default = true;};
    package = lib.mkPackageOption pkgs "zed-editor" {
      nullable = false;
    };
  };
  config = lib.mkIf cfg.enable {
    home.file = {
      ".config/zed/themes/akhlus.json".text = theme;
      ".config/zed/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${flakePath}/modules/hm/zed/zed-settings.json";
    };
    programs.zed-editor = {
      enable = cfg.enable;
      package = cfg.package;
    };
  };
}
