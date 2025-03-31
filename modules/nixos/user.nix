{pkgs,settings,specialArgs,...}:{
  users.users.${settings.username} = {
    isNormalUser = true;
    description = settings.username;
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
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
