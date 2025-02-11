{...}:{
  stylix.targets.ghostty.enable = false;
  home.file = {
    ".config/ghostty/themes/akhlus".source = ./files/ghostty.theme;
  };
  programs.ghostty = {
    enable = true;
    config = {
      background-opacity = 1.000000;
      font-family = "Source Code Pro";
      font-size = 12;
      theme = "akhlus";
    };
  };
}
