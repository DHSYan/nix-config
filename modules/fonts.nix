{ pkgs, ... }: 
{
    fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "Hermit" "Iosevka" "JetBrainsMono" "Terminus"];})
            font-awesome
    ];
}
