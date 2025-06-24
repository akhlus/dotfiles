{...}: {
  imports = [
    ./hardware.nix
  ];
  options.customModules = {
    de = {
      enable = true;
      environment = "gnome";
      enableJovian = true;
    };
    steam.enable = true;
  };
}
