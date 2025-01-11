import os

curdir = os.getcwd()
target_dir = "~/.dotfiles"
os.system(f"cd {target_dir}")
types = ["", "switch", "boot", "test", "build"]
flake_update = input("update flake y/N")
config_update = input("update system y/N")
home_update = input("update homemanager y/N")
rebuild_type = int(input("rebuild mode: 1:switch 2:boot 3:test 4:build"))
if flake_update == "y":
    os.system("nix flake update")
if config_update == "y":
    os.system(f"sudo nixos-rebuild {types[rebuild_type]} --flake .#system")
if home_update == "y":
    os.system(f"home-manager {types[rebuild_type]} --flake .#user")

os.system(f"cd {curdir}")
