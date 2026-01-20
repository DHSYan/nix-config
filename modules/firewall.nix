{ ... }: {

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      443
      4070
      57621 # Spotify
    ];
    allowedUDPPorts = [
      5353 # Spotify
    ];
  };
}
