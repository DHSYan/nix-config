# Nvidia Nix
# This nixos module will hold the stuff that needs to get an nvidia card system
# up and running
{...}:  # I don't think this file depends any input... ?

{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
  	modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
