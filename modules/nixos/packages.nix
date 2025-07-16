{pkgs, ...}: {
  programs = {
    adb.enable = false;
    gnome-disks.enable = true;
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc.lib
        zlib
      ];
    };
  };
  environment.systemPackages = with pkgs; [
    baobab
    bitwarden
    gcc
    gparted
    fwupd
    hwinfo
    inxi
    libgcc
    lm_sensors
    lshw
    #nvtopPackages.full
    v4l-utils
    wireguard-tools
    wireguard-ui
  ];
}
