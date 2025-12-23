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
    ../../modules/tailscale.nix
    ../../modules/paperless.nix

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


  fileSystems."/mnt/immich" = {
    device = "/dev/disk/by-uuid/8a74b761-21ba-4744-ad75-1d17bb4bb6dc";
    fsType = "ext4";
    options = [
      # If you don't have this options attribute, it'll default to "defaults"
      # boot options for fstab. Search up fstab mount options you can use
      #      "users" # Allows any user to mount and unmount
      "nofail" # Prevent system from failing if this drive doesn't mount
      # "umask=002"
      # "uid=995"
      # "gid=993"
      # "allow_other"
    ];
  };

  fileSystems."/mnt/files" = {
    device = "/dev/disk/by-uuid/b18348d6-92ea-47c7-bb5b-8f342e26996a";
    fsType = "ext4";
    options = [
      # If you don't have this options attribute, it'll default to "defaults"
      # boot options for fstab. Search up fstab mount options you can use
      #      "users" # Allows any user to mount and unmount
      "nofail" # Prevent system from failing if this drive doesn't mount
      # "umask=002"
      # "uid=995"
      # "gid=993"
      # "allow_other"
    ];
  };

  system.stateVersion = "24.05";
}
