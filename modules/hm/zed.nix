{
  settings,
  config,
  pkgs,
  ...
}: {
  home.file = {
    ".config/zed/themes/akhlus.json".source = ./files/akhlus.json;
    ".config/zed/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${settings.flakePath}/modules/hm/files/zed-settings.json";
  };

  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
  };
}
