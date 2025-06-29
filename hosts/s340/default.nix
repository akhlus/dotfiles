{...}: {
  imports = [
    ./hardware.nix
  ];
  nMods = {
    de.environment = "cosmic";
  };
}
