{
  hostname,
  pkgs,
  specialArgs,
  username,
  ...
}: {
  users.users.${username} = {
    description = username;
    name = "${username}";
    shell = pkgs.zsh;
  };
  home-manager = {
    backupFileExtension = "bak";
    extraSpecialArgs = specialArgs;
    useGlobalPkgs = true;
    users.${username}.imports = [
      ../hm
      ../hosts/${hostname}/home.nix
    ];
  };
}
