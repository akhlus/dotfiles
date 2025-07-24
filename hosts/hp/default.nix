{...}: {
  imports = [./hardware.nix];
  nMods.de = {
    environment = "gnome";
    enableAutoLogin = false;
  };
}
