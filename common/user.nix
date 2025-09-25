{
  hostname,
  inputs,
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
    sharedModules = [
      inputs.plasma-manager.homeModules.plasma-manager
    ];
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${username}.imports = [
      ../hm
      ../hosts/${hostname}/home.nix
    ];
  };
}
