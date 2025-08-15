{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.hurmit
    nerd-fonts.iosevka
    nerd-fonts.jetbrains-mono
    nerd-fonts.terminess-ttf
    nerd-fonts._3270
    nerd-fonts.zed-mono
    noto-fonts-cjk-sans
    font-awesome
  ];
}
