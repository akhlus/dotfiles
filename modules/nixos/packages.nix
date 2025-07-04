{pkgs, ...}: {
  programs = {
    adb.enable = false;
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc.lib
        zlib
      ];
    };
    gnome-disks.enable = true;
  };
  environment.systemPackages = with pkgs; [
    baobab
    gcc
    gparted
    fwupd
    hwinfo
    inxi
    libgcc
    lm_sensors
    lshw
    v4l-utils
    wireguard-tools
    wireguard-ui
  ];
}
