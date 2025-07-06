{pkgs, ...}: {
  hMods = {
    zed.package = pkgs.zed-editor-fhs;
    vscode.package = pkgs.vscode-fhs;
    ghostty.package = pkgs.ghostty.overrideAttrs (_: {
      preBuild = ''
        shopt -s globstar
        sed -i 's/^const xev = @import("xev");$/const xev = @import("xev").Epoll;/' **/*.zig
        shopt -u globstar
      '';
    });
  };
}
