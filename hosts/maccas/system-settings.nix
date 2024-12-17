{ ... }: 
{
    system.defaults = {
        NSGlobalDomain = {
            # AppleKeyboardUIMode = 3;
            InitialKeyRepeat = 10;
            KeyRepeat = 2;
            ApplePressAndHoldEnabled = false;
        };
        WindowManager.EnableStandardClickToShowDesktop = false;
        # HIHideMenuBar = true;

        # true for display don't have separete spaces
        spaces.spans-displays = true;
    };
    system.defaults.NSGlobalDomain._HIHideMenuBar = false;
    system.defaults.hitoolbox.AppleFnUsageType = "Show Emoji & Symbols";

    environment.loginShellInit = "wallpaper set ~/.dotfiles/wallpaper/cs/cs.png";

    system.keyboard = {
        enableKeyMapping = true;
        remapCapsLockToEscape = true;
    };

}

