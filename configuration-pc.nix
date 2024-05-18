{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      # /etc/nixos/hardware-configuration.nix
      ./configuration.nix
    ];


  networking.hostName = "nixos"; 
  services.xserver.videoDrivers = [ "nvidia" ]; # I mean the desktop could work without this, but the resolution won't be changable
  system.stateVersion = "23.11"; 
}
