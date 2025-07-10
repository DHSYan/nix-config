{ pkgs, config, ... }:
{
    config.services.postgresql = {
        enable = true;
        # enableTCPIP = true;
        # ensureDatabases = [ "mydatabase" ];
#         authentication = pkgs.lib.mkOverride 10 ''
# # TYPE DATABASE USER CIDR-ADDRESS  METHOD
#             local  all  all 0.0.0.0/0 trust
#             '';
    };
}
