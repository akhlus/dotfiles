{pkgs, ...}: {
  home.packages = with pkgs; [
    chromium
    gemini-cli
    libreoffice
  ];
}
