{
  hostName,
  pkgs,
  specialArgs,
  userName,
  ...
}: {
  users.users.${userName} = {
    name = "${userName}";
    home = "/Users/${userName}";
    shell = pkgs.zsh;
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
