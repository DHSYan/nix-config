{ ... }:
{
  networking.wireless = {
    enable = true; # Enables wireless support via wpa_supplicant.
    userControlled.enable = true;
    secretsFile = "/etc/wireless.conf";
    networks = {
      TELUS7918 = {
        pskRaw = "ext:pog_psk";
      };
      eduroam = {
        auth = ''
          key_mgmt=WPA-EAP
          eap=PEAP
          identity="dhsyan@ubc.ca"
          password=ext:eduroam_psk
        '';
      };
      TwinklPhone = {
        pskRaw = "ext:twinklephone_psk";
      };
      "2F1" = {
        pskRaw = "ext:taiwan_psk";
      };
      "Starbucks WiFi" = { };
      "Hommy" = {
        pskRaw = "ext:perry_psk";
      };
      "ubcsecure" = {
        auth = ''
          key_mgmt=WPA-EAP
          eap=PEAP
          identity="dhsyan@ubc.ca"
          password=ext:eduroam_psk
        '';
      };
      "TracyIPhone15" = {
        pskRaw = "ext:momphone_psk";
      };
      "NETGEAR06" = {
          pskRaw = "ext:netgear06_psk";
      };
      "TELUS0167" = {
          pskRaw = "ext:2177_house";
      };
      "cvc office" = {
          pskRaw = "ext:cvc";
      };
      "homeyen" = {
          pskRaw = "ext:homeyen_psk";
      };
    };
  };
}
