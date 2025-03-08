{settings, ...}: {
  programs.zsh = {
    enable = true;
    shellAliases = {
      "ll" = "ls -l";
      ".." = "cd ..";
      "lla" = "ls -la";
      "python" = "python3";
      "py" = "python3";
      "rebuild" = "python3 ${settings.flakePath}/update.py nixos True";
      "nrbs" = "python3 ${settings.flakePath}/update.py nixos True switch";
      "home" = "python3 ${settings.flakePath}/update.py home True";
      "hs" = "python3 ${settings.flakePath}/update.py home True switch";
      "darwin" = "python3 ${settings.flakePath}/update.py darwin True";
      "ds" = "python3 ${settings.flakePath}/update.py darwin True switch";
    };
  };
}
