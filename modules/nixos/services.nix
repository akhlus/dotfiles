{pkgs, ...}: {
  security.rtkit.enable = true;

  services = {
    fwupd.enable = true;
    libinput.enable = true;
    openssh.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    printing.enable = true;
    pulseaudio.enable = false;
    xserver = {
      enable = true;
      xkb.layout = "gb";
      xkb.variant = "";
      excludePackages = [ pkgs.xterm ];
    };
  };
}
