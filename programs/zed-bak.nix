{
  settings,
  pkgs,
  config,
  ...
}: let
  zed-fhs = pkgs.buildFHSUserEnv {
    name = "zed";
    tarketPkgs = pkgs:
      with pkgs; [
        zed-editor
      ];
    runScript = "zed";
  };
in {
  stylix.targets.zed.enable = false;

  home.file = {
    ".config/zed/themes/akhlus.json".source = ./files/akhlus.json;
  };

  programs.zed-editor = {
    enable =
      if settings.hostname == "penguin"
      then false
      else true;
    package = pkgs.zed-editor; # pkgs.zed-editor or zed-fhs as declared above
    extensions = [
      "html"
      "latex"
      "nix"
      "pylsp"
      "rainbow-csv"
      #"ruff"
      "toml"
    ];
    userSettings = {
      base_keymap = "VSCode";
      buffer_font_family = "Zed Plex Mono";
      ui_font_family = "Zed Plex Sans";
      ui_font_size = 14;
      theme = "akhlus";
      buffer_font_size = 14;
      languages = {
        "Python" = {
          language_servers = ["pylsp" "!pyright" "ruff"];
          format_on_save = "on";
          formatter = [
            {code_actions."source.organizeImports.ruff" = true;}
            {language_server.name = "ruff";}
          ];
        };
        "Nix" = {
          language_servers = ["nixd" "!nil"];
          tab_size = 2;
          format_on_save = "off";
        };
      };
      lsp = {
        /*
        ruff = {
          binary.path = "/run/current-system/sw/bin/ruff-lsp";
          initialization_options = {
            lineLength = 80;
            lint = {extendSelect = ["I"];};
          };
        };
        */
        pylsp = {
          binary.path = "~/.nix-profile/bin/pylsp";
        };
        nixd = {
          binary.path = "/home/${settings.name}/.nix-profile/bin/nixd";
          settings = {
            formatting.command = ["alejandra" "--quiet"];
            #doesn't seem to work
            options = {
              home-manager.expr = "(builtins.getFlake \"${settings.flakePath}\").homeConfigurations.home.options";
              flake-parts.expr = "(builtins.getFlake \"${settings.flakePath}\").currentSystem.options";
              nixos.expr = "(builtins.getFlake \"${settings.flakePath}\").nixosConfigurations.system.options";
            };
          };
        };
      };

      terminal = {
        dock = "bottom";
        working_directory = "current_project_directory";
        env = {
          TERM = "ghostty";
        };
      };
    };
  };
}
