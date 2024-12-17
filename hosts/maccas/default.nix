{ pkgs, inputs, ... }: 
{
    imports = [
        ../../modules/homebrew.nix
        ./environment-variables.nix
        ./system-settings.nix
        ./finder.nix
        ./dock.nix
        ./clock.nix
    ];

    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages =
        with pkgs; [ 
            vim
            spotify
            neovim
            fzf
            wget
            git
            coreutils
            kitty
            home-manager
            # libgcc # not in the nix for aarch64-darwin
            ripgrep
            tldr
            unzip
            skhd
            yabai
            racket
            neofetch
            discord
            # lua
            # luajit
            gnumake
            cmake
            unzip
            gnutar
            curl
            # flameshot
            tree-sitter
            zathura
            vscode
            bat
            delta
            eza
            thefuck
            teams
            R
            #protonmail-desktop
            mdcat
            telegram-desktop
            pdftk
            lazygit
            libfido2
            #whatsapp-for-mac
            nodejs_22
            alacritty
            karabiner-elements
            tmux
        ];


    # Auto upgrade nix package and the daemon service.
    services.nix-daemon.enable = true;

    nix.settings.experimental-features = "nix-command flakes";

    programs.zsh.enable = true;  # default shell on catalina

    # Set Git commit hash for darwin-version.
    system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 4;

    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";
}
