{
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
}
