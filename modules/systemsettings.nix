{ ... }: 
{
  time.timeZone = "Australia/Sydney";

  console.useXkbConfig = true;

  services.printing.enable = true; 

  programs.zsh.enable = true;
  
  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # bluetooth
  hardware.bluetooth = {
      enable = true;
      powerOnBoot = true; # does this even work???
  };
  services.blueman.enable = true;

  # virtualisation
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
}
