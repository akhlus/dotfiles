{...}: {
  services.openssh = {
    enable = true;
    extraConfig = ''
      Port 2222
      AddressFamily any
      PermitRootLogin no
      StrictModes yes
      UsePAM yes
    '';
  };
}
