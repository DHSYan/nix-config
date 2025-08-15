{ pkgs, ... }:
{
  users.users.tzen = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "libvirtd"
      "docker"
    ]; # Enable ‘sudo’ for the user.
    # packages = with pkgs; [
    # ];
  };
}
