{ ... }: 
{
    services.xserver.enable = true;
    services.xserver.autorun = false;
    services.xserver.displayManager.startx.enable = true;
    services.xserver.dpi = 110;

    services.xserver.windowManager.dwm.enable = true;
    services.xserver.displayManager.lightdm = {
        enable = false;
    };

    # DWM Overlay
    nixpkgs.overlays = [
        (final: prev: {
         dwm = prev.dwm.overrideAttrs (old: { src = /home/tzen/dwm ;});
         slstatus = prev.slstatus.overrideAttrs (old: { src = /home/tzen/dwm/slstatus ;});
         })
    ];

# Configure keymap in X11
    services.xserver.xkb.layout = "us";
    services.xserver.xkb.variant = "dvorak";
    services.xserver.xkb.options = "caps:escape";

}
