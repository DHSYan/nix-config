{
  description = "Flakes for Everything";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware = {
        url = "github:NixOS/nixos-hardware/master";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-hardware, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        framework = nixpkgs.lib.nixosSystem {
            modules = [ 
                ./configuration-framework.nix  
                nixos-hardware.nixosModules.framework-11th-gen-intel
            ]; 
        };
        pc = nixpkgs.lib.nixosSystem {
            modules = [ ./configuration-pc.nix ]; 
        };
      };

      homeConfigurations.tzen = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home.nix ];

      };
    };
}
