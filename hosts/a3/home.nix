{pkgs, ...}: {
  #used for machine specific config
  home.packages = with pkgs; [
    bambu-studio
    calibre
    kicad-small
  ];
}
