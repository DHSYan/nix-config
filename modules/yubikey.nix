{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    yubioath-flutter
    yubikey-manager
    pam_u2f
  ];

  # Yubikey nice to have - Not worknig yet tho
  services.udev.packages = [ pkgs.yubikey-personalization ];

  services.pcscd.enable = true;
  services.yubikey-agent.enable = true;


  # services.udev.extraRules = ''
  #   ACTION=="remove",\
  #   ENV{ID_BUS}=="usb",\
  #   ENV{ID_MODEL_ID}=="0407",\
  #   ENV{ID_VENDOR_ID}=="1050",\
  #   ENV{ID_VENDOR}=="Yubico",\
  #   RUN+="hyprlock"
  # '';

  # RUN+="${pkgs.systemd}/bin/loginctl lock-sessions"
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  security.pam = {
    u2f = {
      enable = true;
      settings = {
        cue = true;
      };
      control = "required";
    };
    yubico = {
      control = "required";
    };
    services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
    };
  };
}
