{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hMods.packages;
in {
  imports = [
    ./btop
    ./direnv
    ./ghostty
    ./git
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
  };
  config = {
    home.packages = with pkgs;
      [
        alejandra
        fastfetch
        gh
        git
        home-manager
        inter
        lazygit
        nano
        nerd-fonts.blex-mono
        nix-search-cli
        nixd
        python3
        source-code-pro
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
        vlc
      ]);
  };
}
