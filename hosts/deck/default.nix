{...}: {
  imports = [
    ./hardware.nix
  ];
  customModules = {
    steam.enable = true;
    de = {
      enable = true;
      environment = "plasma";
      enableJovian = true;
    };
  };
}
