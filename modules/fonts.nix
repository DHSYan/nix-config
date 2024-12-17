{ pkgs, ... }: 
{
    fonts.packages = with pkgs; [
        # (nerdfonts.override { fonts = [ "Hermit" "Iosevka" "JetBrainsMono" "Terminus"];})
        nerd-fonts.hurmit
        nerd-fonts.iosevka
        nerd-fonts.jetbrains-mono
        nerd-fonts.terminess-ttf
        font-awesome
    ];
}
