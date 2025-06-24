{...}: {
  imports = [
    ./hardware.nix
  ];
  options.customModules = {
    steam.enable = true;
  };
}
