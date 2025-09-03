# Setup guide for nixos-mobile
1. Unlock bootloader
2. Clone the nixos-mobile repo
3. Add a local.nix file with the following code with the values in caps replaced:
<details>
    <summary> local.nix </summary>

    ```nix
    {
    config,
    lib,
    pkgs,
    ...
    }: {
    nixpkgs.config.allowUnfree = true;
    mobile.boot.boot-control.enable = false;
    mobile.beautification.splash = true;

    services.openssh.enable = true;
    services.openssh.settings.PermitRootLogin = "yes";
    services.openssh.settings.PasswordAuthentication = true;

    networking.wireless = {
        enable = true;
        networks = {
        "NETWORK" = {
            psk = "PASSWORD";
        };
        };
    };

    # Set root password for SSH access
    users.users.root.password = "ROOT_PASSWORD.";

    users.users.USER = {
        isNormalUser = true;
        description = "sam";
        extraGroups = ["networkmanager" "wheel"];
        password = "USER_PASSWORD";
    };

    nix = {
        settings.experimental-features = ["nix-command" "flakes"];
        settings.trusted-users = ["sam"];
        optimise.automatic = true;
    };

    #only for lenovo wormdinger
    hardware.firmware = [
        pkgs.chromeos-sc7180-unredistributable-firmware
    ];

    environment.systemPackages = with pkgs; [
        git
        nano
        wget
        curl
    ];
    }
    ```
</details>

4. Run ` nix-build --argstr device device_name -A outputs.default `
5. Flash the resulting image to a usb drive
6. Use `lsblk` to find the device name of the internal storage
7. Run `dd if=/path/to/img of=/dev/blk_name status=progress` to flash to internal storage
