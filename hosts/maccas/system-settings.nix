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
    };
    system.defaults.NSGlobalDomain._HIHideMenuBar = false;

    environment.loginShellInit = "wallpaper set ~/.dotfiles/wallpaper/cs/cs.png";

    system.keyboard = {
        enableKeyMapping = true;
        remapCapsLockToEscape = true;
    };
}

