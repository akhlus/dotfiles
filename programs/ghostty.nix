{settings, ...}: {
  home.file = {
    ".config/ghostty/themes/akhlus".source = ./files/ghostty.theme;
    ".config/ghostty/config".source = ./files/ghostty-config;
  };
  programs.ghostty = {
    enable =
      if settings.de == "apple"
      then false
      else true;
  };
}
