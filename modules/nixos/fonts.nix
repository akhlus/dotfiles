{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      fira-code
      fira-code-symbols
      fira-math
      inter
      material-icons
      noto-fonts-emoji
      source-code-pro
      symbola
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
}
