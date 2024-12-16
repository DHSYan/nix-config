{ config, pkgs, ... }:

{
  imports = [
    ./programs
    ./files
    # ./envvars

  ];

  home = {
    username = "dhsyan";
    homeDirectory = "/Users/dhsyan";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "23.11"; # Please read the comment before changing.

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # yubikey-touch-detector = import ./yubikey-touch-detector.nix;

}