# Eduroam setup
```bash
nix-shell -p "python3.withPackages (ps: with ps; [ dbus-python ])"
python3 <your-eduroam.py>
```
# Rebuild from configuration
```bash
sudo nixos-rebuild switch --flake .#default
```
# Rebuild homemanager
```bash
home-manager switch --flake .#default
```

# Delete old gens
```bash
sudo nix-collect-garbage --delete-older-than 5d
```

# Convert dconf file to nix module
```bash
dconf dump / > dconf.settings
dconf2nix -i dconf.settings -o dconf.nix
```

# Get hardware-config for system
```bash
nixos-generate-config --show-hardware-config  | cat > hardware-configuration.nix
```
# Generate ssh key
```bash
ssh-keygen -t ed25519 -f ~/.ssh/{key_name} -C "key comment"
```
# Get python shells working
```bash
nix shell github:GuillaumeDesforges/fix-python
fix-python --venv .venv
```
