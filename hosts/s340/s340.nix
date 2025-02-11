{
  settings,
  specialArgs,
  ...
}: {
  imports = [
    ./../common/configuration.nix
    ./hardware-s340.nix
  ];
  home-manager = {
    users.${settings.name}.imports = [
      ./../common/home.nix
    ];
    extraSpecialArgs = specialArgs;
  };
}
