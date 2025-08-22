{ pkgs, ... }:
{

  fileSystems."/mnt/immich" = {
    device = "/dev/disk/by-uuid/8a74b761-21ba-4744-ad75-1d17bb4bb6dc";
    fsType = "ext4";
  };
  services.immich = {
    enable = true;
    host = "0.0.0.0";
    port = 2283;
    mediaLocation = "/mnt/immich"; # Ensure this has enough space
    openFirewall = true;
    package = pkgs.immich;
  };
}
