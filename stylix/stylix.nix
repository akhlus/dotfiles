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
    polarity = "dark";
    cursor.size = 24;
    targets = {
      chromium.enable = true;
      gtk.enable = true;
      plymouth.enable = true;
      vscode.enable = true;
      firefox.enable = true;
    };
  };
}
