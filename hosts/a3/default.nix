{...}: {
  imports = [
    ./hardware.nix
  ];
  nMods = {
    de = {
      environment = "gnome";
      enableAutoLogin = true;
    };
    steam.enable = true;
  };
}
