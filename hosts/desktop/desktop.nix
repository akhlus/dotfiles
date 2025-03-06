{...}: {
  imports = [
    ./../common/nixos.nix
    ./hardware-desktop.nix
    ./../common/nvidia.nix
    ./../../programs/steam.nix
  ];
}
