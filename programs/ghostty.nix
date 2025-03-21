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
  };
}
