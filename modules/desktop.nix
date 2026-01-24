{ ... }: 
{
    xdg.mime.defaultApplications = {
        "application/pdf" = "org.pwmt.zathura.desktop";
        "image/*" = [
            "feh.desktop"
        ];
        # "image/jpg" = [
        #     "feh.desktop"
        # ];
        "text/*" = "nvim.desktop";
    };
}

