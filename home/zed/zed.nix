{
  pkgs,
  lib,
  userSettings,
  ...
}: {
  stylix.targets.zed.enable = false;
  imports = [./lsp.nix];
  programs.zed-editor = {
    enable = true;
    extensions = import ./extensions.nix;
    userSettings = {
      base_keymap = "VSCode";
      buffer_font_family = "Zed Plex Mono";
      ui_font_family = "Zed Plex Sans";
      ui_font_size = 14;
      theme = "akhlus";
      buffer_font_size = 14;
      languages = import ./languages.nix;
      terminal = import ./terminal.nix;
    };
  };
}
