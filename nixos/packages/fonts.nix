{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      inter
      material-icons
      nerd-fonts.blex-mono
      noto-fonts-emoji
      source-code-pro
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = ["Inter Variable"];
        sansSerif = ["Inter Variable"];
        monospace = ["BlexMono Nerd Font"];
      };
    };
  };
}
