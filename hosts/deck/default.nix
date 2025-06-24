{...}: {
  imports = [
    ./hardware.nix
  ];
  options.customModules.system = {
    options.customModules = {
      de = {
        enable = true;
        environment = "gnome";
        enableJovian = true;
      };
      steam.enable = true;
    };
  };
}
