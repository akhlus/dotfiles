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
    backupFileExtension = "bak";
    users.${settings.name}.imports = [
      ./../common/home.nix
    ];
    extraSpecialArgs = specialArgs;
  };
}
