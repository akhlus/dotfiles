{
  settings,
  specialArgs,
  ...
}: {
  imports = [
    ./../common/configuration.nix
    ./hardware-desktop.nix
  ];
  home-manager = {
    backupFileExtension = "bak";
    users.${settings.name}.imports = [
      ./desktop-home.nix
    ];
    extraSpecialArgs = specialArgs;
  };
}
