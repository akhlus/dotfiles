{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./nautilus.nix
  ];

  nixpkgs.config.allowUnfree = true;

  fonts.packages = lib.mkDefault (with pkgs; [
    fira-code-symbols
    inter
    nerd-fonts.fira-code
    nerd-fonts.zed-mono
    source-code-pro
  ]);

  fonts.fontconfig = {
    defaultFonts = {
      serif = ["Inter Variable"];
      sansSerif = ["Inter Variable"];
      monospace = ["Source Code Pro"];
    };
  };

  environment.systemPackages = with pkgs; [
    gcc
    libgcc
    lm_sensors
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    zlib
  ];
}
