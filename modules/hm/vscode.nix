{
  isDarwin,
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true;
    package =
      if isDarwin
      then pkgs.vscode
      else pkgs.vscode-fhs;
  };
}
