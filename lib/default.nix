{ nixpkgs, ... }:
{
  mkSystem =
    {
      name,
      system,
      modules,
      inputs,
      isDarwin ? false,
    }:
    {
      func = if isDarwin then "Darwin" else "linux";

      ${name} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        };
        inherit modules;
      };
    };
}
