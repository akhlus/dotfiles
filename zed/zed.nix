{
  pkgs,
  lib,
  userSettings,
  ...
}: let
  extensions = import ./extensions.nix;
  languages = import ./languages.nix;
in {
  imports = [./lsp.nix];
  programs.zed-editor = {
    enable = true;
    extensions = extensions;
    userSettings = {
      base_keymap = "VSCode";
      theme = {
        mode = "dark";
        light = "Ayu Dark";
        dark = "Catppuccin Mocha";
      };
      ui_font_size = 14;
      buffer_font_size = 14;
      languages = languages;
      terminal= import ./terminal.nix;
    };
  };
}
