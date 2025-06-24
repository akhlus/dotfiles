{
  hostName,
  inputs,
  pkgs,
  specialArgs,
  userName,
  ...
}: {
  users.users.${userName} = {
    isNormalUser = true;
    description = userName;
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  home-manager = {
    backupFileExtension = "bak";
    extraSpecialArgs = specialArgs;
    users.${userName}.imports = [
      ../hm
      ../../hosts/${hostName}/home.nix
    ];
  };
}
