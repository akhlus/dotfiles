{
  hostName,
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

  xdg.terminal-exec = {
    enable = true;
    settings.default = ["ghostty.desktop"];
  };

  home-manager = {
    backupFileExtension = "bak";
    extraSpecialArgs = specialArgs;
    users.${userName}.imports = [
      ./pointer.nix
      ../../hm
      ../../hosts/${hostName}/home.nix
    ];
  };
}
