{ pkgs, ... }:
{
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    # waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      rime-data
      fcitx5-gtk
      fcitx5-rime
      fcitx5-chewing
    ];
  };
}
