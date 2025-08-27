{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hMods.packages;
  render-go = inputs.render-go.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
  imports = [
    ./btop
    ./direnv
    ./ghostty
    ./git
    ./neovim
    ./shell
    ./tmux
    ./vscode
    ./xournalpp
    ./zed
  ];
  options.hMods.packages = {
    enableMinimal =
      lib.mkEnableOption "Enable minimal apps: browser, editor, terminal. Auto Enabled by default"
      // {default = true;};
    enableExtra =
      lib.mkEnableOption "Enable extra apps - AI CLI and extra editors. Auto Enabled if linux apss are enabled"
      // {default = cfg.enableLinuxExtra;};
    enableLinuxExtra =
      lib.mkEnableOption "Enable linux extra apps - disk stuff and office suite. Must be false on darwin systems"
      // {default = false;};
    enableServer =
      lib.mkEnableOption "Enable homelab apps - calibre, cockpit, etc"
      // {default = false;};
  };
  config = {
    home.packages = with pkgs;
      [
        alejandra
        fastfetch
        gh
        git
        go
        gopls
        home-manager
        inter
        ibm-plex
        lazygit
        nano
        nerd-fonts.lilex
        nil
        nix-search-cli
        nixd
        python3
        render-go
        speedtest-cli
        tldr
      ]
      ++ (lib.optionals cfg.enableMinimal [
        bitwarden
        brave
        firefox
        google-chrome
        spotify
      ])
      ++ (lib.optionals cfg.enableExtra [
        code-cursor
        discord
        gemini-cli
        spotdl
        yt-dlg
      ])
      ++ (lib.optionals cfg.enableLinuxExtra [
        anki
        baobab
        chromium
        gparted
        libreoffice
        protonvpn-gui
        vlc
      ]);
  };
}
