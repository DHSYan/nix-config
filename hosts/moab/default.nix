{ ... }:
{
  imports = [
    # Include the results of the hardware scan.
    ../../modules/nixsettings.nix
    ../../modules/systempkgs.nix
    ../../modules/hyprland.nix
    ../../modules/user.nix
    ../../modules/fonts.nix
    # ../../modules/yubikey.nix
    ../../modules/systemsettings.nix
    ../../modules/sysenvvars.nix
    ../../modules/keyboard.nix
    ../../modules/networking.nix
    ../../modules/inputmethod.nix
    ../../modules/docker.nix
    ../../modules/postgresql.nix
    # ../../modules/wireguard.nix
    ../../modules/games.nix
    ../../modules/firewall.nix
    ../../modules/lspserverpkgs.nix
    ../../modules/tailscale.nix
    ../../modules/localsend.nix
    ../../modules/virtualization.nix
    ../../modules/k3s.nix
    ../../modules/xdg.nix
    ../../modules/development.nix
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "moab";

  services.xserver.synaptics.horizontalScroll = true;
  # services.xserver.libinput.enable = true; #touchpad
  services.libinput.enable = true;
  services.libinput.touchpad = {
    naturalScrolling = true;
    tappingButtonMap = "lmr";
    tapping = false;
  };

  powerManagement = {
    enable = true;
  };
  services.power-profiles-daemon.enable = false;

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "powersave";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;

      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 60;

      START_CHARGE_THRESH_BAT0 = 60;
      STOP_CHARGE_THRESH_BAT0 = 80;

      START_CHARGE_THRESH_BAT1 = 60;
      STOP_CHARGE_THRESH_BAT1 = 80;

    };
  };
  services.thermald.enable = true;

  services.fwupd.enable = true;

  system.stateVersion = "24.05";
}
