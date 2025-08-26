{ pkgs, ... }:
{

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

  services.immich = {
    enable = true;
    host = "0.0.0.0";
    port = 2283;
    mediaLocation = "/mnt/immich";
    openFirewall = true;
    # package = pkgs.immich;
    accelerationDevices = null;
  };

  hardware.graphics = {
    enable = true;
  };

  users.users.immich.extraGroups = [
    "video"
    "render"
  ];

}
