{
  pkgs,
  settings,
  ...
}: {
  programs.vscode = {
    enable = true;
    package =
      if settings.de == "apple"
      then pkgs.vscode
      else pkgs.vscode-fhs;
  };
}
