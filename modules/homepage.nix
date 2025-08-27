{ ... }:
{
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    listenPort = 8082;
    settings = {
      title = "Lmao";
    };
    allowedHosts = "192.168.1.115:8082,192.168.1.101:8082";
    services = [
      {
        "My First Group" = [
          {
            "PIKVM" = {
              description = "Controls Dayone";
              href = "https://192.168.1.103:314";
            };
          }
          {
            "immich" = {
              description = "Photo Media Server";
              href = "http://192.168.1.101:2283";
            };
          }
          {
            "router" = {
              description = "My Router Setting";
              href = "https://192.168.1.1";
            };
          }
          {
            "EPIC" = {
              description = "My EPIC NAS My First ever homelab machine";
              href = "https://192.168.1.102";
            };
          }
          {
            "Nextcloud" = {
              description = "Mainly for file sharing";
              href = "http://192.168.1.101";
            };
          }
        ];
      }
      {
        "My Second Group" = [
          {
            "My Second Service" = {
              description = "Homepage is the best";
              href = "http://localhost/";
            };
          }
        ];
      }
    ];
  };
}
