# eduroam setup
## open a shell whith all the dependencies needed
nix-shell -p "python3.withPackages (ps: with ps; [ dbus-python ])"
## execute the script
python3 <your-eduroam.py>

# rebuild from configuration
sudo nixos-rebuild switch --flake .#default

# rebuild homemanager
home-manager switch --flake .#default

# delete old gens
sudo nix-collect-garbage --delete-older-than 5d

# dump dconf to dconf.settings
dconf dump / > dconf.settings

# convert dconf file to nix module
dconf2nix -i dconf.settings -o dconf.nix

# get hardware-config for system
nixos-generate-config --show-hardware-config  | cat > hardware-configuration.nix

# generate ssh key
ssh-keygen -t ed25519 -f ~/.ssh/{key_name} -C "key comment"

# start ssh-agent on chrome
eval `ssh-agent -s`