{...}: {
  imports = [
    ./hardware.nix
  ];
  nMods = {
    steam.enable = true;
    de = {
      enable = true;
      environment = "plasma";
      enableJovian = true;
    };
    system.enable = true;
  };
}
