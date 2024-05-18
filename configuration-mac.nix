{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      /etc/nixos/apple-silicon-support
      ./configuration-arm.nix
    ];

  system.stateVersion = "24.05"; 
}

