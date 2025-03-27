{settings, ...}: {
  imports = [
    ./../common/nixos.nix
    ./hardware/hardware-${settings.hostname}.nix
  ];
}
