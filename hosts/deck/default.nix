{...}: {
  imports = [
    ./hardware.nix
  ];
  customModules = {
    steam.enable = true;
  };
}
