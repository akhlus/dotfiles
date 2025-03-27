{settings, ...}: let
  alias = {
    "l" = "ls -a";
    "ll" = "ls -l";
    ".." = "cd ..";
    "lla" = "ls -la";
    "python" = "python3";
    "py" = "python3";
    "nrb" = "sh ${settings.flakePath}/update.sh -p ${settings.flakePath} -t nixos -f";
    "ns" = "sh ${settings.flakePath}/update.sh -p ${settings.flakePath} -t nixos -f -m switch";
    "home" = "sh ${settings.flakePath}/update.sh -p ${settings.flakePath} -t home -f";
    "hs" = "sh ${settings.flakePath}/update.sh -p ${settings.flakePath} -t home -f -m switch";
    "darwin" = "sh ${settings.flakePath}/update.sh -p ${settings.flakePath} -t darwin -f";
    "ds" = "sh ${settings.flakePath}/update.sh -p ${settings.flakePath} -t darwin -f -m switch";
  };
in {
  programs.zsh = {
    enable = true;
    shellAliases = alias;
  };
  programs.bash = {
    enable = true;
    shellAliases = alias;
  };
}
