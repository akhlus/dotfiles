{
  pkgs,
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
    stylix.base16Scheme = userSettings.theme;
  };
}
