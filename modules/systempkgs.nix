{  pkgs, inputs, ...} : 
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
            # "adobe-reader-9.5.5"
    ];
    nixpkgs.config.allowBroken = true;

    environment.systemPackages = with pkgs; [
	    stow
            dmenu
            wezterm
            google-chrome
            brave
            gcc
            clang
            inputs.neovim-nightly.packages.${pkgs.system}.default
            # inputs.ghostty.packages.${pkgs.system}.default
            ripgrep
            tldr
            tmux
            unzip
            zip
            wget
            git
            # xclip
            # xorg.xdpyinfo
            # xorg.xinput
            # xorg.xev
            feh
            zsh
            fzf
            sxhkd
            # texliveMedium # broken as of 2025-01-23
            # racket
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
            gnutar
            curl
            wget
            obsidian # need to enable some electron package
            localsend
            xournalpp
            # thunderbird
            # flameshot
            tlp
            # home-manager
            # xorg.libX11
            # xorg.libxkbfile
            spotifyd
            tree-sitter
            zathura
            bitwarden
            slstatus
            xfce.thunar
            weylus
            lorien
            blueman
            copyq
            albert
            gnupg
            pyenv
            # xss-lock
            # slock
            lightdm
            vscode # Don't tell anyone please, but sometimes I have no choice
            vial
            via
# fcitx5-with-addons
            wmctrl
            bat
            delta
            eza
            mdcat
            mdhtml
            telegram-desktop
            icloudpd
            # adobe-reader
            # virtualbox
            # qemu
            # virt-manager
            spice 
            spice-gtk
            spice-protocol
            win-virtio
            win-spice
            pdftk
            pdfarranger
            hyprland
            waybar
            swaynotificationcenter
            eww
            (waybar.overrideAttrs (old: {
                mesonFlags = old.mesonFlags ++ [ "-Dexperimental=true" ];
                }))
            dunst
            libnotify
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
            # anki
            slurp
            grim
            swappy
            # kmonad
            pavucontrol
            hyprlock
            hyprshot
            playerctl
            nh
            whatsapp-for-linux
            markdownlint-cli
            # kanata
            gh #github cli

            inputs.zen-browser.packages."${system}".default
            # vmware-workstation
            open-vm-tools
            gimp
            jdk
            umlet
            logisim-evolution
            image-roll
            vlc
            samba
            beeper
            bibletime
            nix-index
            docker
            docker-compose
            postman
            lsb-release
            localstack
            aws-sam-cli
            awscli
            obs-studio
            yarn
            gemini-cli
   ];

}
