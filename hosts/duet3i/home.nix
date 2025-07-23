{pkgs, ...}: {
  hMods.packages = {
    enableMinimal = true;
  };
  home.packages = with pkgs; [
    anki
    gemini-cli
  ];
}
