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
