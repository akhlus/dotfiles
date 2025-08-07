{...}: {
  imports = [
    ./hardware.nix
  ];
  nMods = {
    de.environment = "gnome";
  };
}
