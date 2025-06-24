{...}: {
  imports = [
    ./hardware.nix
  ];
  options.customModules.system = {
    options.customModules = {
      de = {
        environment = "gnome";
        enableJovian = true;
      };
      steam.enable = true;
    };
  };
}
