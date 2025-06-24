{pkgs, ...}: {
  imports = [
    ./hardware.nix
  ];
  options.customModules = {
    de.environment = "gnome";
    steam.enable = true;
  };
  programs.npm.enable = true;
  environment.systemPackages = with pkgs; [
    nodejs
  ];
}
