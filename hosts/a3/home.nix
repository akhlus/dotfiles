{pkgs, ...}: {
  hMods.packages = {
    enableLinuxExtra = true;
    vscode.package = pkgs.vscode-fhs;
  };
  #used for machine specific config
  home.packages = with pkgs; [
    calibre
    kicad-small
    openscad
  ];
}
