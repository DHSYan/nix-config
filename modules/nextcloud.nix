{ pkgs, ... }:
{
  services.nextcloud = {
    enable = true;
    home = "/mnt/files";
    # secretFile = "/etc/nextcloud-secret";
    hostName = "localhost";
    package = pkgs.nextcloud32;
    config = {
      adminpassFile = "/etc/nextcloud-admin-pass"; # you need to login as root
      dbtype = "sqlite";
    };
    settings = {
      trusted_domains = [
        "192.168.1.101"
        "dayone"
      ];
    };
  };
}
