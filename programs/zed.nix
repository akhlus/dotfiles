{
  settings,
  config,
  ...
}: {
  home.file = {
    ".config/zed/themes/akhlus.json".source = ./files/akhlus.json;
    ".config/zed/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${settings.flakePath}/programs/files/zed-settings.json";
  };

  programs.zed-editor = {
    enable =
      if settings.hostname == "penguin"
      then false
      else true;
  };
}
