{settings,specialArgs,...}:{
  users.users.${settings.username} = {
    name = "${settings.username}";
    home = "/Users/${settings.username}";
  };


  home-manager = {
    backupFileExtension = "bak";
    extraSpecialArgs = specialArgs;
    users.${settings.username}.imports = [
      ../hm
      ../../hosts/${settings.hostname}/home.nix
    ];
  };
}
