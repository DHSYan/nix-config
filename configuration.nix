{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];


  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use the systemd-boot EFI boot loader. Grub is also available
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = true;

  # networking.hostName = "nixos"; 
  # Pick only one of the below networking options.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Australia/Sydney";

  console.useXkbConfig = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.autorun = false;
  services.xserver.displayManager.startx.enable = true;
  services.xserver.dpi = 110;

  services.xserver.windowManager.dwm.enable = true;
  # DWM Overlay
  nixpkgs.overlays = [
  	(final: prev: {
		dwm = prev.dwm.overrideAttrs (old: { src = /home/tzen/dwm ;});
		slstatus = prev.slstatus.overrideAttrs (old: { src = /home/tzen/dwm/slstatus ;});
        # neovim = prev.neovim.overrideAttrs (old: { src = /home/tzen/neovim; }); how to make this work?
	})
  ];

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  services.xserver.xkb.variant = "dvorak";
  services.xserver.xkb.options = "caps:escape";

  services.printing.enable = true; 

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
  };
  services.blueman.enable = true;

  programs.zsh.enable = true;
  # programs.nix-ld = {
  #     enable = true;
  #     libraries = with pkgs; [
  #       exfat
  #     ];
  # };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tzen = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
    ];
  };

  nixpkgs.config.permittedInsecurePackages = [
	  "electron-25.9.0"
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
     dmenu
     wezterm
     google-chrome
     gcc
     clang
     neovim 
     ripgrep
     tldr
     tmux
     unzip
     wget
     git
     xclip
     xorg.xdpyinfo
     xorg.xinput
     xorg.xev
     feh
     zsh
     fzf
     sxhkd
     texliveSmall
     racket
     neofetch
     libfido2
     sshfs-fuse
     xorg.xsetroot
     spotify
     discord
     lua
     luajit
     gnumake
     cmake
     unzip
     gnutar
     curl
     wget
     obsidian # need to enable some electron package
     localsend
     xournalpp
     thunderbird
     flameshot
     tlp
     home-manager
     xorg.libX11
     xorg.libxkbfile
     spotifyd
     tree-sitter
     nodejs_21
     zathura
     localsend
     bitwarden
     slstatus
     xfce.thunar
     weylus
     lorien
     blueman
     copyq
     xorg.xhost
     albert
   ];

   environment.variables = rec {
       EDITOR = "nvim";
       XDG_CONFIG_HOME = "$HOME/.config";
       ZDOTDIR = "$HOME/.config/zsh";
   };

   fonts.packages = with pkgs; [
     (nerdfonts.override { fonts = [ "Hermit" "Iosevka" "JetBrainsMono" "Terminus"];})
     font-awesome
   ];


  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "23.11"; 
}

