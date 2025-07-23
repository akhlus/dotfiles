{pkgs, userName, ...}: {
  xdg.configFile."systemd/user/cros-garcon.service.d/override.conf".text = ''
    [Service]
    Environment="PATH=%h/.nix-profile/bin:/usr/local/sbin:/usr/local/bin:/usr/local/games:/usr/sbin:/usr/bin:/usr/games:/sbin:/bin"
    Environment="XDG_DATA_DIRS=%h/.nix-profile/share:%h/.local/share:%h/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share"
  '';
  hMods.packages = {
    enableMinimal = false;
    shell.enableZsh = false;
    vscode = {
      enable = true;
      package = pkgs.vscode-fhs;
    };
    xournalpp.enable = true;
  };
  home.sessionVariables = {SSH_AUTH_SOCK = "/home/${userName}/.bitwarden-ssh-agent.sock";};
  home.packages = with pkgs; [
    bitwarden
    nautilus
  ];
}
