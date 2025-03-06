{
  settings,
  specialArgs,
  ...
}: {
  imports = [
    ./../common/darwin.nix
  ];

  home-manager = {
    backupFileExtension = "bak";
    users.${settings.name}.imports = [
      ../${settings.hostname}/${settings.hostname}-home.nix
    ];
    extraSpecialArgs = specialArgs;
  };
}
