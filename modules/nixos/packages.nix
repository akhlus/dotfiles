{pkgs, ...}: {
  imports = [
    ./steam.nix
    ./nautilus.nix
  ];
  programs = {
    adb.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc.lib
        zlib
      ];
    };
    seahorse.enable = true;
  };
  environment.systemPackages = with pkgs; [
    gcc
    gparted
    inxi
    libgcc
    lm_sensors
    v4l-utils
    wireguard-tools
    wireguard-ui
  ];
}
