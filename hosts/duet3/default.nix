{pkgs, ...}: {
  hardware.firmware = [
    pkgs.chromeos-sc7180-unredistributable-firmware
  ];

  mobile = {
    beautification = {
      silentBoot = false;
      splash = false;
    };
    boot.boot-control.enable = false;
  };

  nMods = {
    de = {
      environment = "plasma";
      enableAutoLogin = true;
    };
    boot.enable = false;
    ssh.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHK6sBwLbi0FkwXzzZO7Mbd6ha66KX+zSOJgGUWiTYzL duet3";
  };
}
