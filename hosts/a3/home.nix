{pkgs, ...}: {
  hMods.packages = {
    enableLinuxExtra = true;
    vscode.package = pkgs.vscode-fhs;
  };

  home.packages = with pkgs; [
    calibre
    freecad-wayland
    kicad-small
  ];
}
