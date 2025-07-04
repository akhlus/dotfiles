{...}: {
  imports = [
    ./hardware.nix
  ];
  nMods = {
    de = {
      environment = "plasma";
      enableJovian = true;
      autoStartJovian = false;
    };
    steam.enable = true;
  };
  programs.npm.enable = true;
}
