{settings, ...}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      "ll" = "ls -l";
      ".." = "cd ..";
      "lla" = "ls -la";
      "rebuild" = "sudo nixos-rebuild --flake ${settings.flakePath}#system";
      "home" = "home-manager --flake ${settings.flakePath}#home";
    };
  };
}
