{
  pkgs,
  settings,
  ...
}: {
  programs.home-manager.enable = true;

  imports = [
    ./../common/home.nix
  ];

  nixpkgs.config.allowUnfree = true;

  xdg.configFile."systemd/user/cros-garcon.service.d/override.conf".text = ''
    [Service]
    Environment="PATH=%h/.nix-profile/bin:/usr/local/sbin:/usr/local/bin:/usr/local/games:/usr/sbin:/usr/bin:/usr/games:/sbin:/bin"
    Environment="XDG_DATA_DIRS=%h/.nix-profile/share:%h/.local/share:%h/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share"
  '';

  systemd.user.services.ssh-agent = {
    Unit = {
      Description = "SSH key agent";
    };
    Service = {
      Type = "simple";
      Environment = "SSH_AUTH_SOCK=%t/ssh-agent.socket";
      ExecStart = "/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK";
    };
    Install = {
      WantedBy = ["default.target"];
    };
  };

  services.gnome-keyring = {
    enable = true;
    components = ["ssh"];
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = "$XDG_RUNTIME_DIR/ssh-agent.socket";
  };

  home.packages = with pkgs; [
    gnome-text-editor
    kgx
    nautilus
  ];
}
