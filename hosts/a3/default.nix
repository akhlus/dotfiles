{pkgs, ...}:{
  imports = [
    ./hardware.nix
  ];
  programs.npm.enable = true;
  environment.systemPackages = with pkgs; [
    nodejs
  ];
}
