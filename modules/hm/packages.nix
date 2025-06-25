{
  isDarwin,
  lib,
  pkgs,
  ...
}: {
  home.packages =
    (with pkgs; [
      alejandra
      brave
      code-cursor
      discord
      fastfetch
      ffmpeg
      firefox
      gh
      google-chrome
      home-manager
      inter
      jdk
      mpv
      nano
      nix-search-cli
      nixd
      pandoc
      pciutils
      python3
      python3Packages.python-lsp-server
      ruff
      source-code-pro
      speedtest-cli
      spotify
      tldr
      ungit
      unzip
      usbutils
      wget
      yt-dlp
      yt-dlg
    ])
    ++ lib.optional isDarwin pkgs.raycast
    ++ lib.optionals (!isDarwin) (with pkgs; [
      anki
      chromium
      fwupd
      hwinfo
      libreoffice
      lshw
      powertop
      protonvpn-gui
      qmk
      spotdl
      vial
      vlc
    ]);
}
