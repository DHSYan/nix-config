{ ... }: 
{
    home.file = {

        ".config/git/config".source = ~/.dotfiles/git/config;
        ".config/git/.gitignore_global".source = ~/.dotfiles/git/.gitignore_global;

        ".config/zsh/.zshrc".source = ~/.dotfiles/zsh/.zshrc;
        ".config/zsh/.p10k.zsh".source = ~/.dotfiles/zsh/.p10k.zsh;

        ".config/wezterm".source = ~/.dotfiles/wezterm;

        ".config/sxhkd".source = ~/.dotfiles/sxhkd;

        ".ssh/config".source = ~/.dotfiles/ssh/config;

        ".config/nvim".source = ~/.dotfiles/nvim; 

        ".xinitrc".source = ~/.dotfiles/x11/.xinitrc;

        ".config/tmux/tmux.conf".source = ~/.dotfiles/tmux/tmux.conf;

        ".config/zathura".source = ~/.dotfiles/zathura;

        "./throw-away-code/init.txt" = {
            target = "./throw-away-code/init.txt";
            text = "hi"; 
        };

        ".config/kitty".source = ~/.dotfiles/kitty;
        ".config/hypr".source = ~/.dotfiles/hypr;

        "./.trash/init.trash" = {
            target = "./.trash/.init.trash";
            text = "this is iiniting trash"; 
        };
    };
}
