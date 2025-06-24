{...}: {
  imports = [
    ./hardware.nix
  ];
  customModules = {
    steam.enable = true;
    de = {
      enable = true;
      environment = "plasma6";
      enableJovian = true;
    };
  };
}
