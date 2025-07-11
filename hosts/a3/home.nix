{pkgs, ...}: {
  hMods = {
    zed.package = pkgs.zed-editor-fhs;
    vscode.package = pkgs.vscode-fhs;
  };
  #used for machine specific config
  home.packages = with pkgs; [
    bambu-studio
    calibre
    kicad-small
    openscad
  ];
}
