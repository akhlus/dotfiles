{...}: {
  imports = [
    ./hardware.nix
  ];
  nMods = {
    de = {
      environment = "cosmic";
      enableAutoLogin = true;
    };
    steam.enable = true;
  };
}
