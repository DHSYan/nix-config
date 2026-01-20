{ pkgs, ... }:
{
  services.immich = {
    enable = true;
    host = "0.0.0.0";
    port = 2283;
    mediaLocation = "/mnt/immich";
    openFirewall = true;
    # package = pkgs.immich;
    accelerationDevices = null;
    redis.enable = true;
  };

  hardware.graphics = {
    enable = true;
  };

  users.users.immich.extraGroups = [
    "video"
    "render"
  ];

}
