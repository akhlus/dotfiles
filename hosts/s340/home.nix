{pkgs, ...}: {
  hMods.packages = {
    enableLinuxExtra = true;
  };
  home.packages = [pkgs.protonvpn-gui];
}
