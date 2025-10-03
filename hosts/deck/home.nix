{
  config,
  inputs,
  pkgs,
  ...
}: {
  nixGL = {
    packages = inputs.nixgl.packages;
    installScripts = ["mesa"];
  };

  hMods = {
    #flatpak.enable = true;
    packages = {
      enableMinimal = false;
      ghostty = {
        enable = true;
        package = config.lib.nixGL.wrap pkgs.ghostty;
      };
      xournalpp.enable = true;
      zed = {
        enable = true;
        package = config.lib.nixGL.wrap pkgs.zed-editor;
      };
    };
  };
}
