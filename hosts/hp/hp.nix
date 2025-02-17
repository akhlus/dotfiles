{
  settings,
  specialArgs,
  ...
}: let
  settings.gpu = "intel";
in {
  imports = [
    ./../common/configuration.nix
    ./hardware-hp.nix
  ];
  home-manager = {
    backupFileExtension = "bak";
    users.${settings.name}.imports = [
      ./hp-home.nix
    ];
    extraSpecialArgs = specialArgs;
  };
}
