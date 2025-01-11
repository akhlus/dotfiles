{
  pkgs,
  lib,
  userSettings,
  ...
}: {
  programs.zed-editor.userSettings.lsp = {
    ruff = {
      binary = {path_lookup = true;};
      initialization_options = {
        lineLength = 80;
        lint = {extendSelect = ["I"];};
      };
    };
    pylsp = {
      binary = {path_lookup = true;};
    };
    nixd = {
      binary = {path_lookup = true;};
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
    nil = {
      binary = {path_lookup = true;};
      settings = {
        diagnostics.ignored = ["unused_binding"];
      };
    };
  };
}
