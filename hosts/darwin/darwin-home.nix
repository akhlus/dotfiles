{pkgs, ...}: {
  imports = [
    ../common/home.nix
    ../../programs/programs.nix
  ];
  home.sessionPath = [
    "/opt/homebrew/bin"
  ];
  home.packages = with pkgs; [
    raycast
  ];
}
