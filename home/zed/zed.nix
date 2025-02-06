{
  pkgs,
  lib,
  userSettings,
  ...
}: {
  imports = [./lsp.nix];
  programs.zed-editor = {
    enable = true;
    extensions = import ./extensions.nix;
    userSettings = lib.mkForce {
      base_keymap = "VSCode";
      buffer_font_family = "Zed Plex Mono";
      ui_font_family = "Zed Plex Sans";
      ui_font_size = 14;
      buffer_font_size = 14;
      languages = import ./languages.nix;
      terminal = import ./terminal.nix;
    };
  };
}
