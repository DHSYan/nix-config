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

    system.primaryUser = "dhsyan";

    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.allowBroken = true;
    environment.systemPackages =
        with pkgs; [ 
            vim
            spotify
            inputs.neovim-nightly.packages.${pkgs.system}.default
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
            # racket
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
            # thefuck
            # teams
            R
            #protonmail-desktop
            mdcat
            telegram-desktop
            pdftk
            lazygit
            libfido2
            #whatsapp-for-mac
            nodejs_22
            # alacritty
            # karabiner-elements
            tmux
            jdk
# ghostty
        ];


    # Auto upgrade nix package and the daemon service.
    # services.nix-daemon.enable = true; # was told to remove this 

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
