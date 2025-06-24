{...}: {
  imports = [
    ./hardware.nix
  ];
  customModules = {
    steam.enable = true;
    de = {
      enable = true;
      environment = "gnome";
      enableJovian = true;
    };
  };
}
