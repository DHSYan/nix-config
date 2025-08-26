{
  modulesPath,
  lib,
  pkgs,
  ...
}@args:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
    ./hardware-configuration.nix
    ../../modules/user.nix
    ../../modules/immich.nix
    # ../../modules/dashy.nix
    ../../modules/inputmethod.nix
    ../../modules/nixsettings.nix
    ../../modules/systempkgs-server.nix
    ../../modules/docker.nix
  ];
  boot.loader.grub = {
    # no need to set devices, disko will add all devices that have a EF02 partition to the list already
    # devices = [ ];
    efiSupport = true;
    efiInstallAsRemovable = true;
  };
  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    dashy-ui
    immich-cli
    immich
  ];

  networking.interfaces.eth0.wakeOnLan.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      80
      443
      8080
      2283
    ];
    allowedUDPPortRanges = [
      {
        from = 4000;
        to = 4007;
      }
      {
        from = 8000;
        to = 8010;
      }
    ];
  };

  users.users.root.openssh.authorizedKeys.keys = [
    # change this to your ssh key
    "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIMoVAIrI4nMtW06w18N7W8V86PQnD/16xgTY2KOT/a5rAAAADHNzaDp5dWJpa2V5NQ== ssh:yubikey5"
  ];

  system.stateVersion = "24.05";
}
