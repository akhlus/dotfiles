{pkgs, lib, ...}:
let
  extensions = import ./extensions.nix;
  languages = import ./languages.nix;
  lsp = import ./lsp.nix;
in
{
  programs.zed-editor ={
    enable = true;
    extensions = extensions;
    userSettings = {
      base_keymap="VSCode";
      theme = {
          mode = "dark";
          light = "Ayu Dark";
          dark = "Catppuccin Mocha";
      };
      ui_font_size = 14;
      buffer_font_size = 14;
      lsp = lsp;
      languages = languages;
    };
  };
}
