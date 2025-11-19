{ pkgs, ... }:
{
  programs.zsh.enable = true;
  users.users.tzen = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "libvirtd"
      "docker"
      "uinput"
    ]; 

    openssh.authorizedKeys.keys = [
      "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIMoVAIrI4nMtW06w18N7W8V86PQnD/16xgTY2KOT/a5rAAAADHNzaDp5dWJpa2V5NQ== ssh:yubikey5"
    ];
  };
}
