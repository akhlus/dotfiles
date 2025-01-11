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
      theme = {
        mode = "dark";
        light = "Ayu Dark";
        dark = "Catppuccin Mocha";
      };
      ui_font_size = 14;
      buffer_font_size = 14;
      languages = import ./languages.nix;
      terminal= import ./terminal.nix;
    };
  };
}
