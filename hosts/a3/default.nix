{...}: {
  imports = [
    ./hardware.nix
  ];
  nMods = {
    de = {
      environment = "cosmic";
    };
    steam.enable = true;
  };
}
