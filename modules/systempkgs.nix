{ pkgs, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;

  # this allows us to run binaries?
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs;
      [
        # exfat
      ];
  };

  nixpkgs.config.permittedInsecurePackages = [
    "electron-36.9.5"
    # "adobe-reader-9.5.5"
    "qtwebengine-5.15.19"
  ];
  nixpkgs.config.allowBroken = true;

  environment.systemPackages = with pkgs; [
    zellij
    opencode
    wineWowPackages.waylandFull
    # wineWowPackages.stable
    wine64
    koreader
    readest
    yazi
    direnv
    kubectl
    # lsof
    # rustup
    tsocks
    luajitPackages.luarocks
    texliveSmall
    python3
    tailscale-systray
    # claude-code
    # devbox
    libreoffice
    # devenv
    # ngrok
    # nodejs
    nixd
    nixfmt
    # typescript-language-server
    # tinymist
    harper
    # webex
    # gromit-mpx
    nextcloud-client
    # wireguard-tools
    wakeonlan
    # whatsie
    # typst
    stow
    # dmenu
    wezterm
    google-chrome
    # brave
    gcc
    clang
    clang-tools
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
    racket
    libfido2
    sshfs-fuse
    # xorg.xsetroot
    spotify
    discord
    lua
    luajit
    # gnumake
    # cmake
    # (cmake.overrideAttrs (old: 
    #   { version = "3.5.2";
    #     src = fetchurl { 
    #             url = "https://github.com/Kitware/CMake/releases/download/v4.1.2/cmake-4.1.2.tar.gz";
    #             sha256 = "643f04182b7ba323ab31f526f785134fb79cba3188a852206ef0473fee282a15";
    #           }
    #         ;}))
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
    # bitwarden-desktop
    slstatus # TODO ???
    thunar
    weylus
    lorien
    blueman
    btop
    copyq
    # albert
    gnupg
    # pyenv
    # xss-lock
    # slock
    lightdm
    vscode # Don't tell anyone please, but sometimes I have no choice
    # vial
    # via
    # fcitx5-with-addons
    wmctrl
    bat
    delta
    eza
    mdcat
    mdhtml
    telegram-desktop
    # icloudpd
    # adobe-reader
    # virtualbox
    # qemu
    # virt-manager
    spice
    spice-gtk
    spice-protocol
    virtio-win
    win-spice
    pdftk
    pdfarranger
    hyprland
    waybar
    swaynotificationcenter
    eww
    (waybar.overrideAttrs
      (old: { mesonFlags = old.mesonFlags ++ [ "-Dexperimental=true" ]; }))
    dunst
    libnotify
    # kitty
    hyprpaper
    alacritty
    rofi
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
    markdownlint-cli
    # kanata
    gh # github cli

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
    # bibletime
    nix-index
    docker
    docker-compose
    postman
    lsb-release
    localstack
    # aws-sam-cli
    # awscli
    obs-studio
    yarn
    # gemini-cli
    rstudio
    R
    powertop
    zotero
    google-cloud-sdk
    brave
    # xrdp
    # awscli2
  ];

}
