{config, ...}: let
  cfg = config.hMods.packages.shell;
in {
  programs.direnv = {
    enable = true;
    enableBashIntegration = cfg.enableBash;
    enableZshIntegration = cfg.enableZsh;
    nix-direnv.enable = true;
  };
}
