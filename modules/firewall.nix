{ ... }: 
{

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      443
      4070
    ];
    # allowedUDPPortRanges = [
    #   {
    #     from = 4000;
    #     to = 4007;
    #   }
    #   {
    #     from = 8000;
    #     to = 8100;
    #   }
    # ];
  };
}
