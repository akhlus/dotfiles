{userName, ...}: {
  imports = [
    ./hardware.nix
  ];
  nMods = {
    de = {
      environment = "plasma";
    };
    steam.enable = true;
  };
  services.displayManager.autoLogin = {
    enable = true;
    user = userName;
  };
}
