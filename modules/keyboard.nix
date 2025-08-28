{ lib, ... }:
{
  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  # services.xserver.xkb.variant = "dvorak";
  services.xserver.xkb.options = "caps:escape";
  console.keyMap = lib.mkDefault "dvorak";

  # xkbOptions = "grp:win_space_toggle";
}
