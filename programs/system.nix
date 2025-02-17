{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./nautilus.nix
  ];

  nixpkgs.config.allowUnfree = true;

  fonts = {
    packages = with pkgs; [
      inter
      source-code-pro
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = ["Inter Variable"];
        sansSerif = ["Inter Variable"];
        monospace = ["Source Code Pro"];
      };
    };
  };
  programs.seahorse.enable = true;

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
