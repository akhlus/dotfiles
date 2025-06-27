{...}: {
  imports = [
    ./hardware.nix
  ];
  nMods = {
    de.environment = "gnome";
    steam.enable = true;
  };
  programs.npm.enable = true;
}
