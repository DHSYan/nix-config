{ ... }:
{
    system.defaults.dock = {
        autohide = true;
        minimize-to-application = true;
        orientation = "right";
        persistent-apps = [
            "/Applications/Bitwarden.app"
            "/Applications/Zen Browser.app"
            "/Applications/Obsidian.app"
            "/Applications/Nix Apps/kitty.app"
            "/Applications/Nix Apps/Discord.app"
            "/Applications/Nix Apps/Spotify.app"
        ];
        persistent-others = [
          "~/Downloads"
        ];
        show-recents = false;
        tilesize = 32;
    };

}
