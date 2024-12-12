{ ... }:
{
  hardware.opentabletdriver.enable = true;
  boot.initrd.unl0kr.allowVendorDrivers = true;
  services.xserver.wacom.enable = true;
}
