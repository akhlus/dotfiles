{userSettings, ...}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      "ll" = "ls -l";
      ".." = "cd ..";
      "lla" = "ls -la";
      "rebuild" = "sudo nixos-rebuild --flake ${userSettings.flakePath}#system";
      "home" = "home-manager --flake ${userSettings.flakePath}";
    };
  };
}
