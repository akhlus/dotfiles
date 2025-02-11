{
  config,
  pkgs,
  systemSettings,
  inputs,
  ...
}: {
  stylix.targets.ghostty.enable = false;
  home.file = {
    ".config/ghostty/themes/akhlus".source = ./files/ghostty.theme;
  };
  programs.ghostty = {
    enable = true;
    settings = {
      background-opacity = 1.000000;
      font-family = "Source Code Pro";
      font-size = 12;
      theme = "akhlus";
    };
    package =
      if systemSettings.hostname == "penguin"
      then (config.lib.nixGL.wrappers.mesa pkgs.ghostty)
      else pkgs.ghostty;
  };
}
