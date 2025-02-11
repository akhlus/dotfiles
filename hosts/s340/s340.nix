{
  userSettings,
  specialArgs,
  ...
}: {
  imports = [
    ./../common/configuration.nix
    ./hardware-s340.nix
  ];
  home-manager = {
    users.${userSettings.name}.imports = [
      ./../common/home.nix
    ];
    extraSpecialArgs = specialArgs;
  };
}
