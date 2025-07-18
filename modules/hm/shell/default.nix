{
  flakePath,
  lib,
  pkgs,
  ...
}: let
  alias = {
    "l" = "ls -a";
    "ll" = "ls -l";
    ".." = "cd ..";
    "lla" = "ls -la";
    "python" = "python3";
    "py" = "python3";
    "nrb" = "sh ${flakePath}/update.sh -p ${flakePath} -s nixos -f";
    "ns" = "sh ${flakePath}/update.sh -p ${flakePath} -s nixos -f -m switch";
    "home" = "sh ${flakePath}/update.sh -p ${flakePath} -s home -f";
    "hs" = "sh ${flakePath}/update.sh -p ${flakePath} -s home -f -m switch";
    "darwin" = "sh ${flakePath}/update.sh -p ${flakePath} -s darwin -f";
    "ds" = "sh ${flakePath}/update.sh -p ${flakePath} -s darwin -f -m switch";
  };
in {
  programs.zsh = {
    enable = true;
    shellAliases = alias;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh.enable = true;
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./p10k-config;
        file = "p10k.zsh";
      }
    ];
    initContent = ''
      if [ -f $HOME/.zshrc-personal ]; then
        source $HOME/.zshrc-personal
      fi
    '';
  };
  programs.bash = {
    enable = true;
    shellAliases = alias;
  };
  home.shell = {
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
