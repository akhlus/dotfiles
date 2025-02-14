{
  pkgs,
  settings,
  ...
}: {
  stylix = {
    enable =
      if settings.theme == "none"
      then false
      else true;
    autoEnable = false;
    image = ./files/tignes.jpg;
    polarity = "dark";
    base16Scheme =
      if settings.theme == "none" || settings.theme == "local"
      then ./files/theme.yaml
      else "${pkgs.base16-schemes}/share/themes/${settings.theme}.yaml";
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
