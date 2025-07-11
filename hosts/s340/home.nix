{pkgs, ...}: {
  hMods = {
    zed.package = pkgs.zed-editor-fhs;
    vscode.package = pkgs.vscode-fhs;
  };
}
