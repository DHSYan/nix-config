{ ... }: 
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      443
      8080
      2283
      8082
    ];
    allowedUDPPortRanges = [
      {
        from = 4000;
        to = 4007;
      }
      {
        from = 8000;
        to = 8100;
      }
    ];
  };
}
