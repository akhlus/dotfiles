{config, ...}: let
  cfg = config.hMods.packages.shell;
in {
  programs.fzf = {
    enable = true;
    enableBashIntegration = cfg.enableBash;
    enableZshIntegration = cfg.enableZsh;
    defaultOptions = ["--preview 'bat --style=numbers --color=always {}'"];
  };
}
