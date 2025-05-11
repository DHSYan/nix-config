{ config, pkgs, ... }: 
{
    imports = [
        ../../modules/nixsettings.nix
        ../../modules/systempkgs.nix
        ../../modules/user.nix
        ../../modules/systemsettings.nix
        ../../modules/sysenvvars.nix
        ../../modules/keyboard.nix
        ./hardware-configuration.nix
    ];

    # bootloader 
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "nixos"; 
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.open = true;

    environment.systemPackages = with pkgs; [
        egl-wayland
        xwayland
        dconf
    ];
    

    system.stateVersion = "24.11"; 
}

