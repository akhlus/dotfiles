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
    ./eza
    ./fzf
    ./ghostty
    ./git
    ./neovim
    ./shell
    ./tmux
    ./vscode
    ./xournalpp
    ./zed
    ./zoxide
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
        bat
        dust
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
        nix-search-cli
        nixd
        python3
        render-go
        ripgrep
        speedtest-cli
        tldr
      ]
      ++ (lib.optionals cfg.enableMinimal [
        bitwarden
        brave
        firefox
      ])
      ++ (lib.optionals cfg.enableExtra [
        code-cursor
        discord
        gemini-cli
        google-chrome
        spotdl
        spotify
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
