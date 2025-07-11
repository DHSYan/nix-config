{ pkgs, config, ... }:
{
    services.postgresql = {
        enable = true;
        ensureDatabases = [ "mydatabase" "postgres" ];
        enableTCPIP = true;
        authentication = pkgs.lib.mkOverride 10 ''
            #...
            #type database DBuser origin-address auth-method
            local all       all     trust
            # ipv4
            host  all      all     127.0.0.1/32   trust
            # ipv6
            host all       all     ::1/128        trust
            '';
        initialScript = pkgs.writeText "backend-initScript" ''
            CREATE DATABASE postgres;
            CREATE ROLE nixcloud WITH LOGIN PASSWORD 'nixcloud' CREATEDB;
            CREATE DATABASE nixcloud;
            GRANT ALL PRIVILEGES ON DATABASE nixcloud TO nixcloud;
        '';
        settings = {
            port = 5432;
            # ssl = true;
        };
};
}
