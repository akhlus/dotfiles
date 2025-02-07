{
  pkgs,
  userSettings,
  stylix,
  ...
}: {
  stylix = {
    enable =
      if userSettings.theme == "none"
      then false
      else true;
    autoEnable = true;
    image = ./tignes.jpg;
    polarity = "dark";
    base16Scheme =
      if userSettings.theme == "none" || userSettings.theme == "local"
      then "./theme.yaml"
      else "${pkgs.base16-schemes}/share/themes/${userSettings.theme}.yaml";
    fonts = {
      serif = {
        name = "Inter Variable";
        package = pkgs.inter;
      };
      sansSerif = {
        name = "Inter Variable";
        package = pkgs.inter;
      };
      monospace = {
        name = "Zed Mono";
        package = pkgs.nerd-fonts.zed-mono;
      };
      sizes.terminal = 10;
    };
    #cursor = {
    #  package = pkgs.afterglow-cursors-recolored;
    #  name = "Afterglow-Recolored-Catppuccin-Macchiato";
    #  size = 20;
    #};
  };
}
