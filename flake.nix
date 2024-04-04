{
  description = "Flakes for Everything";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager,... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
	modules = [ ./configuration.nix ]; 
      };

      # Can the below be done?
      #nixosConfigurations.nvidia = nixpkgs.lib.nixosSystem {
      #  modules = [ ./configuration.nix ./nvidia.nix ]; 
      #};

      homeConfigurations.tzen = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home.nix ];

      };
    };
}
