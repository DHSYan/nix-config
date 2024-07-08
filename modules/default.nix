{
    x11 = import ./x11.nix;
    nixsettings = import ./nixsettings.nix;
    systemsettings = import ./systemsettings.nix;
    systempkgs = import ./systempkgs.nix;
    user = import ./user.nix;
    font = import ./fonts.nix;
    yubikey = import ./yubikey.nix;
}
