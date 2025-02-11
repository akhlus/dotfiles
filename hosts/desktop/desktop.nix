{
  userSettings,
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
    users.${userSettings.name}.imports = [
      ./../common/home.nix
    ];
    extraSpecialArgs = specialArgs;
  };
}
