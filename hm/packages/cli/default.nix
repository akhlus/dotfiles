{...}: {
  imports = [
    ./btop.nix
    ./git.nix
    ./shell.nix
    ./ssh.nix
  ];
  programs = {
    atuin = {
      enable = true;
      settings = {
        dialect = "uk";
        search_mode = "prefix";
        flags = ["--disable-up-arrow"];
      };
    };
    bat.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    eza = {
      enable = true;
      icons = "auto";
      extraOptions = [
        "-lh"
        "--group-directories-first"
      ];
    };
    fzf = {
      enable = true;
      defaultOptions = ["--preview 'bat --style=numbers --color=always {}'"];
    };
    lazygit.enable = true;
    ripgrep.enable = true;
    starship = {
      enable = true;
      settings = builtins.fromTOML (builtins.readFile ./starship.toml);
    };
    tmux.enable = true;
    zoxide.enable = true;
  };
}
