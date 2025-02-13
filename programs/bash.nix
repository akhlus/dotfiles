{settings, ...}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      "ll" = "ls -l";
      ".." = "cd ..";
      "lla" = "ls -la";
      "rebuild" = "python ${settings.flakePath}/update.py nixos True";
      "nrbs" = "python ${settings.flakePath}/update.py nixos True switch";
      "home" = "python ${settings.flakePath}/update.py home True";
      "hs" = "python ${settings.flakePath}/update.py home True switch";
    };
  };
}
