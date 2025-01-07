{pkgs, lib, ...}:
{
  programs.zed-editor ={
    enable = true;
    extensions = ["nix" "html" "ruff" "rainbow-csv" "pylsp" "catppuccin"];
    userSettings = {
      base_keymap="VSCode";
      theme = {
          mode = "dark";
          light = "Ayu Dark";
          dark = "Catpuccin Mocha";
      };
      show_whitespaces = "all" ;
      ui_font_size = 14;
      buffer_font_size = 14;
      lsp = {
        ruff = {
          binary = {path_lookup = true;};
          initialization_options = {
            lineLength = 80;
            lint = {extendSelect=["I"];};
          };
        };
        nixd = {
          binary = {path_lookup = true;};
        };
      };
      languages = {
        "Python" = {
          language_servers = ["pylsp" "!pyright" "ruff"];
          format_on_save = "on";
          formatter = [
            {code_actions.source.organizeImports.ruff = true;}
            {language_server.name = "ruff";}
          ];
        };
        "Nix" = {
          tab_size = 2;
          language_servers = ["nixd"];
          format_on_save = "off";
        };
      };
    };
  };
}
