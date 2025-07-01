{...}: {
  imports = [
    ./hardware.nix
  ];
  nMods = {
    de.environment = "plasma";
    steam.enable = true;
  };
  programs.npm.enable = true;
}
