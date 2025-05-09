{settings, lib, pkgs, ...}: let
  alias = {
    "l" = "ls -a";
    "ll" = "ls -l";
    ".." = "cd ..";
    "lla" = "ls -la";
    "python" = "python3";
    "py" = "python3";
    "nrb" = "sh ${settings.flakePath}/update.sh -p ${settings.flakePath} -s nixos -f";
    "ns" = "sh ${settings.flakePath}/update.sh -p ${settings.flakePath} -s nixos -f -m switch";
    "home" = "sh ${settings.flakePath}/update.sh -p ${settings.flakePath} -s home -f";
    "hs" = "sh ${settings.flakePath}/update.sh -p ${settings.flakePath} -s home -f -m switch";
    "darwin" = "sh ${settings.flakePath}/update.sh -p ${settings.flakePath} -s darwin -f";
    "ds" = "sh ${settings.flakePath}/update.sh -p ${settings.flakePath} -s darwin -f -m switch";
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
