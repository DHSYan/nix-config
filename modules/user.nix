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
    "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAINlSFY1nzD/IDexKoe5rta1ghxofI32jhrjm5IIt4K1tAAAADXNzaDp5dWJpa2V5NWM= ssh:yubikey5c"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDARsPhFF2gc0OoHdAYa35UMMy0e9daqQwtuYgJrunW8z/OgP7XQcjzzc3HGR5kOJmYd6GgAnRJ1JgeWQHfK7qFUDXPgf1Ri9FK0VbObt6M7Mpm5PfzGwpS7uIuOHeOt0Dc6MKUhAdsp3IqZIOyHguIDc53FBmnrY+dkYigTOyBaDQ90A7EoHGR2F5knRkRiJsiuPpGOSmvbJu9mYMybznXe2pK9i72oPJ7vnr+rc+hAej8m6qwPYsWkAZ6f5kKUFnyX7TyZUNkQnK+pwui61sxvMdDGGbpuzBm3Gcu+hujBkD+DbRvacckPSHsH5fcr3e/lCSeHRsxw/cyFLbFPDcXBiZz1ndqQas0T4ZyimBQAwAgvEohhL5ePLjLA0vQljs8y5CenpoETGUwEdcytcHhiBsdQIGck8h828Nrlc2XpCfbdTbPV9lzteoD5uUpRhYS79iuVqPEC2TnXZ8cu4uXdNuZs5JCMcBWa63RyhXxacIRlWfzu76PburA5D1Hv2m1KE/MGjmYoN/WDwB8FWCM/qxgq157pQl9J4scg0gYRJI9Mw6zqVuIxCnWGBwX67WBXJ7PnwjwvTWa91qkvUK8NgRDhGm9+7KgdKinVY0v4taVr9XfasKP8n/GL92jiSlAnuBb2XYDM2rtcGXpJeukBAX4dNdZuNwVd0ZGRH2wXQ== tzen@iPhone-15042024"
    ];
  };
}
