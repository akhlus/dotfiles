{
  settings,
  pkgs,
  config,
  ...
}: let
  zed-fhs = pkgs.buildFHSUserEnv {
    name = "zed";
    tarketPkgs = pkgs:
      with pkgs; [
        zed-editor
      ];
    runScript = "zed";
  };
in {
  stylix.targets.zed.enable = false;

  home.file = {
    ".config/zed/themes/akhlus.json".source = ./files/akhlus.json;
    ".config/zed/settings.json".source = config.lib.file.mkOutOfStoreSymlink "${settings.flakePath}/programs/files/zed-settings.json";
  };

  programs.zed-editor = {
    enable =
      if settings.hostname == "penguin"
      then false
      else true;
    package = pkgs.zed-editor; # pkgs.zed-editor or zed-fhs as declared above
  };
}
