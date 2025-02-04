{
  pkgs,
  userSettings,
  stylix,
  ...
}: {
  stylix = {
    enable =
      if userSettings.theme != "none"
      then true
      else false;
    autoEnable = true;
    image = ./tignes.jpg;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${userSettings.theme}.yaml";
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
      sizes.terminal = 10;
    };
    #cursor = {
    #  package = pkgs.afterglow-cursors-recolored;
    #  name = "Afterglow-Recolored-Catppuccin-Macchiato";
    #  size = 20;
    #};
  };
}
