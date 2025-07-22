{
  flakePath,
  userName,
  ...
}: {
  environment.variables = {
    FLAKE_PATH = "${flakePath}";
    LD_LIBRARY_PATH = "$NIX_LD_LIBRARY_PATH";
    SSH_AUTH_SOCK = "/home/${userName}/.bitwarden-ssh-agent.sock";
  };
}
