{...}: {
  imports = [
    ./hardware.nix
  ];
  nix.settings.trusted-users = ["root" "sam"];
  nMods = {
    de = {
      environment = "cosmic";
      enableAutoLogin = true;
    };
    steam.enable = true;
  };
}
