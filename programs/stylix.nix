{
  pkgs,
  userSettings,
  ...
}: {
  stylix = {
    enable =
      if userSettings.theme == "none"
      then false
      else true;
    autoEnable = true;
    image = ./files/tignes.jpg;
    polarity = "dark";
    base16Scheme =
      if userSettings.theme == "none" || userSettings.theme == "local"
      then ./files/theme.yaml
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
        name = "Source Code Pro";
        package = pkgs.source-code-pro;
      };
    };
    cursor = {
      package = pkgs.afterglow-cursors-recolored;
      name = "Afterglow-Recolored-Catppuccin-Macchiato";
      size = 18;
    };
  };
}
