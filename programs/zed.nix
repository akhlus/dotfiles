{
  settings,
  config,
  pkgs,
  ...
}: {
  home.file = {
    ".config/zed/themes/akhlus.json".source = ./files/akhlus.json;
    ".config/zed/settings.json".source =
      if settings.de == "apple"
      then ./files/zed-settings.json
      else config.lib.file.mkOutOfStoreSymlink "${settings.flakePath}/programs/files/zed-settings.json";
  };

  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;
  };
}
