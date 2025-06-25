{config, inputs, pkgs, ...}: {
  nixGL.packages = inputs.nix-gl.packages;
  nixGL.defaultWrapper = "mesa";
  nixGL.installScripts = [ "mesa" ];

  hMods = {
    ghostty.package = config.lib.nixGL.wrap pkgs.ghostty;
    zed.package = config.lib.nixGL.wrap pkgs.zed-editor;
    vscode.package = pkgs.vscode-fhs;
  };

  services.flatpak = {
    update.auto.enable = true;
    uninstallUnmanaged = true;
    packages = [
      "com.brave.Browser"
      "com.spotify.Client"
      "com.discordapp.Discord"
    ];
  };
}
