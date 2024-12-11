{ pkgs, inputs, ...} : 
{
    nixpkgs.config.allowUnfree = true;

    # this allows us to run binaries?
    programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
            # exfat
        ];
    };

    nixpkgs.config.permittedInsecurePackages = [
            "electron-25.9.0"
            "adobe-reader-9.5.5"
    ];

    environment.systemPackages = with pkgs; [
            dmenu
            wezterm
            google-chrome
            brave
            gcc
            clang
            inputs.neovim-nightly.packages.${pkgs.system}.default
            ripgrep
            tldr
            tmux
            unzip
            wget
            git
            xclip
            # xorg.xdpyinfo
            # xorg.xinput
            # xorg.xev
            feh
            zsh
            fzf
            sxhkd
            texliveMedium
            racket
            neofetch
            libfido2
            sshfs-fuse
            # xorg.xsetroot
            spotify
            discord
            lua
            luajit
            gnumake
            cmake
            unzip
            gnutar
            curl
            wget
            obsidian # need to enable some electron package
            localsend
            xournalpp
            thunderbird
            flameshot
            tlp
            home-manager
            # xorg.libX11
            # xorg.libxkbfile
            spotifyd
            tree-sitter
            zathura
            localsend
            bitwarden
            slstatus
            xfce.thunar
            weylus
            lorien
            blueman
            copyq
            # xorg.xhost
            albert
            gnupg
            python3
            # python312Packages.pip
            python312Packages.pandas
            # xorg.xmodmap
            xss-lock
            slock
            lightdm
            vscode # Don't tell anyone please, but sometimes I have no choice
            vial
            via
# fcitx5-with-addons
            wmctrl
            bat
            delta
            eza
            thefuck
            teams-for-linux
            R
            rstudio
            p3x-onenote
            protonmail-desktop
            mdcat
            mdhtml
            telegram-desktop
            icloudpd
            adobe-reader
            virtualbox
            qemu
            virt-manager
            spice 
            spice-gtk
            spice-protocol
            win-virtio
            win-spice
            pdftk
            pdfarranger
            nodejs_22
            hyprland
            waybar
            swaynotificationcenter
            eww
            (waybar.overrideAttrs (old: {
                mesonFlags = old.mesonFlags ++ [ "-Dexperimental=true" ];
                }))
            dunst
            libnotify
            # swww #wallpaper deamen
            kitty
            hyprpaper
            alacritty
            rofi-wayland
            wofi
            networkmanagerapplet
            wpa_supplicant_gui
            wl-clipboard
            lazygit
            zed-editor
            brightnessctl
            zoom-us
            anki
            slurp
            grim
            swappy
            kmonad
            pavucontrol
            hyprlock
            hyprshot
            playerctl
            nh
            whatsapp-for-linux
            ticktick
            markdownlint-cli
            kanata
            gh #github cli

            inputs.zen-browser.packages."${system}".default
            vmware-workstation
            open-vm-tools
   ];

}
