{
  settings,
  specialArgs,
  ...
}: {
  imports = [
    ./../common/configuration.nix
    ./hardware-hp.nix
  ];
  home-manager = {
    users.${settings.name}.imports = [
      ./../common/home.nix
      ./../../programs/linux.nix
    ];
    extraSpecialArgs = specialArgs;
  };
}
