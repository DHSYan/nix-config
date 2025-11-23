{
  modulesPath,
  lib,
  pkgs,
  ...
}@args:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
    ./hardware-configuration.nix
    ../../modules/user.nix
    ../../modules/immich.nix
    ../../modules/homepage.nix
    ../../modules/inputmethod.nix
    ../../modules/nixsettings.nix
    ../../modules/systempkgs-server.nix
    ../../modules/docker.nix
    ../../modules/firewall-server.nix
    ../../modules/nextcloud.nix
    ../../modules/root.nix

  ];
  boot.loader.grub = {
    # no need to set devices, disko will add all devices that have a EF02 partition to the list already
    # devices = [ ];
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    dashy-ui
    immich-cli
    immich
  ];

  networking.interfaces.eth0.wakeOnLan.enable = true;


  system.stateVersion = "24.05";
}
