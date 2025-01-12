{
  pkgs,
  lib,
  userSettings,
  ...
}: {
  programs.zed-editor.userSettings.lsp = {
    ruff = {
      binary.path = "/run/current-system/sw/bin/ruff-lsp";
      initialization_options = {
        lineLength = 80;
        lint = {extendSelect = ["I"];};
      };
    };
    pylsp = {
      binary.path = "/run/current-system/sw/bin/pylsp";
    };
    nixd = {
      binary.path = "/run/current-system/sw/bin/nixd";
      settings = {
        formatting.command = ["alejandra" "--quiet"];
        /*
           doesn't seem to work
        options = {
          home-manager.expr = "(builtins.getFlake \"${userSettings.flakePath}\").homeConfigurations.user.options";
          flake-parts.expr = "(builtins.getFlake \"${userSettings.flakePath}\").currentSystem.options";
          nixos.expr = "(builtins.getFlake \"${userSettings.flakePath}\").nixosConfigurations.system.options";
        };
        */
      };
    };
  };
}
