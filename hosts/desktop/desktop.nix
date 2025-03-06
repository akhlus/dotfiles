{...}: {
  imports = [
    ./../common/configuration.nix
    ./hardware-desktop.nix
    ./../common/nvidia.nix
    ./../../programs/steam.nix
  ];
}
