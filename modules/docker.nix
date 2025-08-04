{ ... }: 
{
    virtualisation.docker.enable = true;
    # users.users.<myuser>.extraGroups = [ "docker" ];
    users.extraGroups.docker.members = [ "username-with-access-to-socket" ];
}
