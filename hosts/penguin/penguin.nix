{pkgs, userSettings, inputs, ...}: {
  programs.home-manager.enable = true;

  imports = [
    ./../common/home.nix
  ];

  nixpkgs.config.allowUnfree = true;

  nixGL.packages = inputs.nixgl.packages;

  xdg.configFile."systemd/user/cros-garcon.service.d/override.conf".text = ''
    [Service]
    Environment="PATH=%h/.nix-profile/bin:/usr/local/sbin:/usr/local/bin:/usr/local/games:/usr/sbin:/usr/bin:/usr/games:/sbin:/bin"
    Environment="XDG_DATA_DIRS=%h/.nix-profile/share:%h/.local/share:%h/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share"
  '';
  /*
  xdg.desktopEntries = {
    ghostty = {
      name = "Ghostty";
      icon = "com.mitchellh.ghostty";
      type = "Application";
      exec = "nixGLMesa ghostty";
      terminal = false;
    };
  };
  */

  home.packages = with pkgs; [
    gnome-text-editor
    kgx
    nautilus
  ];
}
