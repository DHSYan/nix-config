{ inputs, pkgs, ... }:
{
  security.polkit.enable = true;
  services = {
    # enable = true;
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
  };
  services.displayManager.defaultSession = "hyprland";

  programs.hyprland = {
    enable = true;
    # nvidiaPatches = true;
    xwayland.enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    systemd.setPath.enable = true;
    package = inputs.hyprland-nightly.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
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

  # environment.sessionVariables = {
  #     # NIXOS_OZONE_WL = "1";
  # };

  hardware = {
    # opengl.enable = true;
    graphics.enable = true;
    graphics.enable32Bit = true;
    nvidia.modesetting.enable = true;
  };
}
