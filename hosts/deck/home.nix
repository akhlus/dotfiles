{
  config,
  inputs,
  pkgs,
  ...
}: {
  nixGL.packages = inputs.nixgl.packages;
  nixGL.defaultWrapper = "mesa";
  nixGL.installScripts = ["mesa"];

  hMods = {
    ghostty.package = config.lib.nixGL.wrap pkgs.ghostty;
    zed.package = config.lib.nixGL.wrap pkgs.zed-editor;
    vscode.package = pkgs.vscode-fhs;
  };
}
