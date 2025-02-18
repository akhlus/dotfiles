{settings, ...}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      "ll" = "ls -l";
      ".." = "cd ..";
      "lla" = "ls -la";
      "rebuild" = "python3 ${settings.flakePath}/update.py nixos True";
      "nrbs" = "python3 ${settings.flakePath}/update.py nixos True switch";
      "home" = "python3 ${settings.flakePath}/update.py home True";
      "hs" = "python3 ${settings.flakePath}/update.py home True switch";
    };
  };
}
