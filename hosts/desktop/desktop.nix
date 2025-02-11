{
  settings,
  specialArgs,
  ...
}: {
  imports = [
    ./../common/configuration.nix
    ./hardware-desktop.nix
    ./../common/nvidia.nix
    ./../../programs/steam.nix
  ];
  home-manager = {
    users.${settings.name}.imports = [
      ./../common/home.nix
    ];
    extraSpecialArgs = specialArgs;
  };
}
