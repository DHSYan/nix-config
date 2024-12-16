{
  description = "Sean's Nix Config";

  # @attrset
  # Defines all the dependencies of this flake
  # These will get passed as arguments into the outputs function below
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay/master";
    };
    hyprland-nightly = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };

    zen-browser.url = "github:MarceColl/zen-browser-flake";

  };
  # @function => attrset
  # the return value represent the build result
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixos-hardware,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        nixosConfigurations = {
          framework = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {
              inherit inputs;
              inherit system;
            };
            modules = [
              ./hosts/framework
              nixos-hardware.nixosModules.framework-11th-gen-intel
            ];
          };
          pc = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {
              inherit inputs;
              inherit system;
            };
            modules = [
              ./hosts/asus-rog-z790i
            ];
          };

          moab = nixpkgs.lib.nixosSystem {
            inherit system;
            specialArgs = {
              inherit inputs;
              inherit system;
            };
            modules = [
              ./hosts/moab
              nixos-hardware.nixosModules.framework-13-7040-amd
            ];
          };
        };

        homeConfigurations.tzen = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          modules = [ ./home ];

        };

        devShells = {
          default = pkgs.mkShell {
            packages = with pkgs; [
              nixfmt-rfc-style
              nixd
            ];
            name = "nix-dev-shell";

            # inputsFrom = with pkgs; [
            #   nixfmt-rfc-style
            # ];

            shellHook = ''
              zsh
            '';

          };
        };
      }
    );
}
