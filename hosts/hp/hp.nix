{
  userSettings,
  specialArgs,
  ...
}: {
  imports = [
    ./../common/configuration.nix
    ./hardware-hp.nix
  ];
  home-manager = {
    users.${userSettings.name}.imports = [
      ./../common/home.nix
      ./../../programs/linux.nix
    ];
    extraSpecialArgs = specialArgs;
  };
}
