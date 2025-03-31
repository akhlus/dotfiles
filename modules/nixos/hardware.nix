{...}: {
  hardware = {
    enableRedistributableFirmware = true;
    graphics.enable = true;
    keyboard.qmk.enable = true;
    logitech.wireless = {
      enable = true;
      enableGraphical = true;
    };
  };
}
