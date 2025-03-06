{settings, ...}: {
  home.file = {
    ".config/ghostty/themes/akhlus".source = ./files/ghostty.theme;
    ".config/ghostty/config".source = ./files/ghostty-config;
  };
  programs.ghostty = {
    enable =
      if settings.hostname == "penguin" || settings.hostname == "mba"
      then false
      else true;
    settings = {
      background-opacity = 0.95;
      config-file = "?user-config";
      font-family = "Source Code Pro";
      font-size = 12;
      theme = "akhlus";
      window-theme = "ghostty";
    };
  };
}
