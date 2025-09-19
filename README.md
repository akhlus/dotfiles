# Config for my systems using nix

## Useful Commands for using nix system
### Get hardware-config for system
```bash
nixos-generate-config --show-hardware-config  | cat > hardware-configuration.nix
```
### Eduroam setup
```bash
nix-shell -p "python3.withPackages (ps: with ps; [ dbus-python ])"
python3 <your-eduroam.py>
```
### Convert dconf file to nix module
```bash
dconf dump / > dconf.settings
dconf2nix -i dconf.settings -o dconf.nix
```
