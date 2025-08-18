{ pkgs, inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  # this allows us to run binaries?
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # exfat
    ];
  };

  # nixpkgs.config.permittedInsecurePackages = [
  #   "electron-25.9.0"
  #   # "adobe-reader-9.5.5"
  # ];
  # nixpkgs.config.allowBroken = true;

  environment.systemPackages = with pkgs; [
    stow
    gcc
    clang
    inputs.neovim-nightly.packages.${pkgs.system}.default
    ripgrep
    tmux
    unzip
    zip
    wget
    git
    zsh
    fzf
    neofetch
    libfido2
    sshfs-fuse
    gnutar
    curl
    wget
    bat
    delta
    eza
    networkmanagerapplet
    lazygit
    nh
    docker
    docker-compose
    yarn
  ];
}
