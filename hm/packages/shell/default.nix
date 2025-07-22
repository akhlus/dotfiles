{
  config,
  flakePath,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hMods.packages.shell;
  alias = {
    "l" = "ls -a";
    "ll" = "ls -l";
    ".." = "cd ..";
    "lla" = "ls -la";
    "python" = "python3";
    "py" = "python3";
    "nrb" = "sh ${flakePath}/update.sh -p ${flakePath} -s nixos ";
    "ns" = "sh ${flakePath}/update.sh -p ${flakePath} -s nixos -m switch";
    "home" = "sh ${flakePath}/update.sh -p ${flakePath} -s home";
    "hs" = "sh ${flakePath}/update.sh -p ${flakePath} -s home -m switch";
    "darwin" = "sh ${flakePath}/update.sh -p ${flakePath} -s darwin";
    "ds" = "sh ${flakePath}/update.sh -p ${flakePath} -s darwin -m switch";
    "theme-render" = "python3 ${flakePath}/modules/hm/cosmetic/render.py";
    "update" = "sudo apt update && sudo apt upgrade -y";
  };
in {
  options.hMods.packages.shell = {
    enableZsh = lib.mkEnableOption "Enable zsh" // {default = true;};
    enableBash = lib.mkEnableOption "Enable bash" // {default = true;};
  };
  config = {
    programs.zsh = {
      enable = cfg.enableZsh;
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
      enable = cfg.enableBash;
      shellAliases = alias;
    };
    home.shell = {
      enableBashIntegration = cfg.enableBash;
      enableZshIntegration = cfg.enableZsh;
    };
  };
}
