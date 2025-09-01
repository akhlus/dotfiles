{config, ...}: let
  cfg = config.hMods.packages.shell;
in {
  programs.eza = {
    enable = true;
    enableBashIntegration = cfg.enableBash;
    enableZshIntegration = cfg.enableZsh;
    icons = "auto";
    extraOptions = [
      "-lh"
      "--group-directories-first"
    ];
  };
}
