# open a shell whith all the dependencies needed
nix-shell -p "python3.withPackages (ps: with ps; [ dbus-python ])"
# execute the script
python3 <your-eduroam.py>

#rebuild from configuration
sudo nixos-rebuild switch --flake .#default

#rebuild homemanager
home-manager switch --flake .#default


