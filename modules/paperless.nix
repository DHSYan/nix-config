{ ... }: 
{
    services.paperless = {
        enable = true;
        passwordFile = "/etc/paperless-admin-pass";
    };
}
