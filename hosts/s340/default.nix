{...}: {
  imports = [
    ./hardware.nix
  ];
  nMods = {
    de.environment = "gnome";
    ssh.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILVmDsq/cQ+Tc5Pd5HR7vvZ22gLsMh4afo5eN/08H75O s340";
  };
}
