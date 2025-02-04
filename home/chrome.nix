{pkgs, ...}: {
  programs.home-manager.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
  };

  xdg.configFile."systemd/user/cros-garcon.service.d/override.conf".text = ''
    [Service]
    Environment="PATH=%h/.nix-profile/bin:/usr/local/sbin:/usr/local/bin:/usr/local/games:/usr/sbin:/usr/bin:/usr/games:/sbin:/bin"
    Environment="XDG_DATA_DIRS=%h/.nix-profile/share:%h/.local/share:%h/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share"
  '';

  home.packages = with pkgs; [
    alejandra
    brave
    firefox
    gh
    git
    gnome-console
    nano
    nautilus
    nixgl.nixGLMesa
    nixgl.nixVulkanMesa
    tldr
    ungit
    unzip
    vlc
    xournalpp
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };

  stylix.targets.vscode.enable = false;
}