{
  config,
  pkgs,
  pkgs-stable,
  systemSettings,
  userSettings,
  stylix,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = false;
    image = ./../tignes.jpg;
    imageScalingMode="fill";
    polarity = "dark";
    cursor.size = 24;
    fonts = {
      serif = {
        name = "Inter Variable";
        package = pkgs.inter;
      };
      sansSerif = {
        name = "Inter Variable";
        package = pkgs.inter;
      };
    };
    targets = {
      chromium.enable = true;
      gtk.enable = true;
      plymouth.enable = true;
    };
  };
}
