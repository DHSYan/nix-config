{ pkgs, ... }:
{
  # i18n.inputMethod = {
  #     type = "fcitx5";
  #     enable = true;
  #     fcitx5.addons = with pkgs; [
  #         fcitx5-gtk
  #         fcitx5-chinese-addons
  #     ];
  # };
  # i18n.inputMethod = {
  #     enable = true;
  #     type = "ibus";
  #     ibus.engines = with pkgs.ibus-engines; [ /* any engine you want, for example */  ];
  # };

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
