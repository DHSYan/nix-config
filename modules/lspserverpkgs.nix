{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nixd
    libclang
    lua-language-server
  ];
}
