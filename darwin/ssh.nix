{username, ...}: {
  environment.variables = {
    SSH_AUTH_SOCK = "/Users/${username}/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock";
  };
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
