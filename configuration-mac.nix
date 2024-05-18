{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      /etc/nixos/apple-silicon-support
      ./configuration-aarch.nix
    ];

  system.stateVersion = "24.05"; 
}

