{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tzen";
  home.homeDirectory = "/home/tzen";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
  #home.enableNixpkgsReleaseCheck = false;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".config/git/config".source = ~/.dotfiles/git/config;
    ".config/git/.gitignore_global".source = ~/.dotfiles/git/.gitignore_global;

    ".config/zsh/.zshrc".source = ~/.dotfiles/zsh/.zshrc;

    ".config/wezterm".source = ~/.dotfiles/wezterm;

    ".config/sxhkd".source = ~/.dotfiles/sxhkd;

    ".ssh/config".source = ~/.dotfiles/ssh/config;

    ".config/nvim".source = ~/.dotfiles/nvim; 

    ".xinitrc".source = ~/.dotfiles/x11/.xinitrc;

    ".config/tmux".source = ~/.dotfiles/tmux;
    
    ".config/zathura".source = ~/.dotfiles/zathura;

    "./throw-away-code/init.txt" = {
        target = "./throw-away-code/init.txt";
        text = "hi"; 
    };
    


  };

  # Apparently this is not setting my variable
  home.sessionVariables = {
    EDITOR = "nvim";
    ZDOTDIR = "$HOME/.config/zsh";
    XDG_CONFIG_HOME = "$HOME/.config";
  };


  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
