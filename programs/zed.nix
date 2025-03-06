{
  settings,
  config,
  ...
}: {
  home.file = {
    ".config/zed/themes/akhlus.json".source = ./files/akhlus.json;
    ".config/zed/settings.json".source = if settings.de == "apple" then ./files/zed-settings.json
    else config.lib.file.mkOutOfStoreSymlink "~/.dotfiles/programs/files/zed-settings.json";
  };

  programs.zed-editor = {
    enable =
      if settings.hostname == "penguin"
      then false
      else true;
  };
}
