{config, ...}: let
  cfg = config.hMods.packages.shell;
in {
  programs.zoxide = {
    enable = true;
    enableBashIntegration = cfg.enableBash;
    enableZshIntegration = cfg.enableZsh;
  };
}
