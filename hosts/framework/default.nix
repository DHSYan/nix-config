{ ... }:
{
  imports =
    [ # Include the results of the hardware scan.
        ../../modules/nixsettings.nix
        ../../modules/systempkgs.nix
        # ../../modules/x11.nix
        ../../modules/hyprland.nix
        ../../modules/user.nix
        ../../modules/fonts.nix
        # ../../modules/yubikey.nix
        ../../modules/systemsettings.nix
        ../../modules/sysenvvars.nix
        ../../modules/keyboard.nix
        ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; 
  networking.wireless =  {
      enable = true;  # Enables wireless support via wpa_supplicant.
      userControlled.enable = true;
      secretsFile = "/etc/wireless.conf";
      networks = {
          TELUS7918 = {
              pskRaw = "ext:pog_psk";
          };
          eduroam = {
              auth = ''
                  key_mgmt=WPA-EAP
                  eap=PEAP
                  identity="dhsyan@ubc.ca"
                  password=ext:eduroam_psk
              '';
          };
          TwinklePhone = {
              pskRaw = "ext:twinklephone_psk";
          };
          "2F1" = {
              pskRaw = "ext:taiwan_psk";
          };
      };
  };

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

  services.tlp = {
  	enable = true;
	settings = {
		CPU_SCALING_GOVERNOR_ON_AC = "performance";
		CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

		CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
		CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

		CPU_MIN_PERF_ON_AC = 0;
		CPU_MAN_PERF_ON_AC = 100;
		CPU_MIN_PERF_ON_BAT = 0;
		CPU_MAN_PERF_ON_BAT = 20;

		START_CHARGE_THRESH_BAT0 = 40;
		STOP_CHARGE_THRESH_BAT0 = 80;

	};
  };
  services.thermald.enable = true;
  
  system.stateVersion = "24.05"; 
}
