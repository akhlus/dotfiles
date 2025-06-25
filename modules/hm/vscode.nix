{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hMods.vscode;
in {
  options.hMods.vscode = {
    enable = lib.mkEnableOption "Enable VSCode" // {default = true;};
    package = lib.mkPackageOption pkgs "vscode" {
      nullable = false;
    };
  };
  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = cfg.package;
    };
  };
}
