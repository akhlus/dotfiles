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
    userSettings = {
      base_keymap = "VSCode";
      buffer_font_family = lib.mkForce "Zed Plex Mono";
      ui_font_family = lib.mkForce "Zed Plex Sans";
      ui_font_size = lib.mkForce 14;
      buffer_font_size = lib.mkForce 14;
      languages = import ./languages.nix;
      terminal = import ./terminal.nix;
    };
  };
}
