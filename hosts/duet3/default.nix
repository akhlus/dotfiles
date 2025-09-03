{pkgs, ...}: {
  mobile.boot.boot-control.enable = false;
  mobile.beautification.splash = true;
  hardware.firmware = [
    pkgs.chromeos-sc7180-unredistributable-firmware
  ];

  environment = {
    systemPackages = with pkgs; [libwacom];
    variables = {GSK_RENDERER = "ngl";};
    etc = {
      "libwacom/google-wormdingler.tablet".text = ''
        [Device]
        Name=hid-over-i2c 0603:604A Stylus
        ModelName=
        DeviceMatch=i2c|0603|604a
        Class=ISDV4
        Width=5.35433
        Height=8.54331
        IntegratedIn=Display;System
        Styli=@generic-no-eraser

        [Features]
        Stylus=true
        Touch=false
      '';
      "libinput/local-overrides.quirks".text = ''
        [Google Chromebook Wormdingler Stylus Digitizer]
        MatchUdevType=tablet
        MatchDeviceTree=*wormdingler*
        MatchBus=i2c
        ModelChromebook=1
        AttrPressureRange=1100:1000
      '';
    };
  };

  nMods = {
    de = {
      environment = "gnome";
      enableAutoLogin = true;
    };
    boot.enable = false;
    ssh.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHK6sBwLbi0FkwXzzZO7Mbd6ha66KX+zSOJgGUWiTYzL duet3";
  };
}
