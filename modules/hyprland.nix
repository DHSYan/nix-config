{ pkgs, ... }: 
{
    security.polkit.enable = true;
    services.xserver = {
        enable = true;
        displayManager = {
            defaultSession = "hyprland";
            gdm = {
                enable = true;
                wayland = true;
            };
        };
    };

    programs.hyprland = {
        enable = true;
        # nvidiaPatches = true;
        xwayland.enable = true;
        portalPackage = pkgs.xdg-desktop-portal-hyprland;
        systemd.setPath.enable = true;
        package = pkgs.hyprland;
    };

    xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    services.hypridle = {
        enable = true;

    };
    programs.hyprlock = {
        enable = true;

    };

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
    };

    hardware = {
        opengl.enable = true;
        nvidia.modesetting.enable = true;
    };
}
