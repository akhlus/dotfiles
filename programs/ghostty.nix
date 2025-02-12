{
  pkgs,
  settings,
  inputs,
  ...
}: {
  stylix.targets.ghostty.enable = false;
  home.file = {
    ".config/ghostty/themes/akhlus".source = ./files/ghostty.theme;
  };
  programs.ghostty = {
    enable =
      if settings.hostname == "penguin"
      then false
      else true;
    settings = {
      background-opacity = 1.000000;
      font-family = "Source Code Pro";
      font-size = 12;
      theme = "akhlus";
    };
  };
}
