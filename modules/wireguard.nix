{ ... }:
{
  networking.firewall = {
    allowedUDPPorts = [ 51820 ]; # Clients and peers can use the same port, see listenport
  };
  networking.wg-quick.interfaces.wg0.configFile = "/etc/wireguard/wg0.conf";
}
