{
  config,
  lib,
  ...
}: let
  cfg = config.hMods.packages;
in {
  options.hMods.packages.tmux = {
    enable = lib.mkEnableOption "Enable tmux" // {default = cfg.enableMinimal;};
  };
  config = (lib.mkIf cfg.tmux.enable) {
    programs.tmux = {
      enable = cfg.tmux.enable;
    };
  };
}
