{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      /etc/nixos/apple-silicon-support
      ./configuration.nix
    ];

  system.stateVersion = "24.05"; 
}

