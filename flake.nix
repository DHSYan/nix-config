{
  description = "Sean's Nix Config";

  # @attrset
  # Defines all the dependencies of this flake
  # These will get passed as arguments into the outputs function below
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay/master";
    };
    # ghostty = {
    #  url = "github:ghostty-org/ghostty";
    # };
    hyprland-nightly = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    # Optional: Declarative tap management
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    # This follwing thing apparently solves the permission problem on a fresh install
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    nikitabobko-homebrew-tap = {
      url = "github:nikitabobko/homebrew-tap";
      flake = false;
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # @function => attrset
  # the return value represent the build result
  outputs =
    {
      self,
      nixpkgs,
      # home-manager,
      nixos-hardware,
      flake-utils,
      nix-darwin,
      homebrew-core,
      homebrew-cask,
      nix-homebrew,
      disko,
      ...
    }@inputs:
    let
      set1 =
        let
          system = "x86_64-linux";
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

            dayone = nixpkgs.lib.nixosSystem {
              inherit system;
              specialArgs = {
                inherit inputs;
                inherit system;
              };
              modules = [
                disko.nixosModules.disko
                ./hosts/dayone
              ];
            };

            factorysecond = nixpkgs.lib.nixosSystem {
              inherit system;
              specialArgs = {
                inherit inputs;
                inherit system;
              };
              modules = [
                disko.nixosModules.disko
                ./hosts/factorysecond
              ];
            };
            pivpn = nixpkgs.lib.nixosSystem {
              system = "aarch64-linux";
              specialArgs = {
                inherit inputs;
                system = "aarch64-linux";
              };
              modules = [
                disko.nixosModules.disko
                ./hosts/pivpn
              ];
            };
          };

          # homeConfigurations.tzen = home-manager.lib.homeManagerConfiguration {
          #   inherit pkgs;

          #   modules = [ ./home ];

          # };

          # homeConfigurations.dhsyan = home-manager.lib.homeManagerConfiguration {
          #   pkgs = self.darwinConfigurations."Ding-Hans-MacBook-Pro".pkgs;
          #   modules = [ ./temp ];
          # };

          darwinConfigurations."Ding-Hans-MacBook-Pro" = nix-darwin.lib.darwinSystem {
            system = "aarch64_darwin";
            specialArgs = { inherit inputs; };
            modules = [
              ./hosts/maccas
              nix-homebrew.darwinModules.nix-homebrew
              {
                nix-homebrew = {
                  # Install Homebrew under the default prefix
                  enable = true;

                  # Apple Silicon Only: Also install Homebrew under the
                  # default Intel prefix for Rosetta 2
                  enableRosetta = true;

                  # User owning the Homebrew prefix
                  user = "dhsyan";

                  # Optional: Declarative tap management
                  taps = {
                    "homebrew/homebrew-core" = homebrew-core;
                    "homebrew/homebrew-cask" = homebrew-cask;
                    "homebrew/homebrew-bundle" = inputs.homebrew-bundle;
                    "nikitabobko/homebrew-tap" = inputs.nikitabobko-homebrew-tap;
                    # "koekeishiya/homebrew-formulae" = inputs.yabai-homebrew-tap;
                  };

                  # Optional: Enable fully-declarative tap management
                  #
                  # With mutableTaps disabled, taps can no longer be
                  # added imperatively with `brew tap`.
                  mutableTaps = false;
                };
              }
            ];
          };
        };

      set2 = flake-utils.lib.eachDefaultSystem (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          devShells = {
            default = pkgs.mkShell {
              NIX_SSHOPTS = "-i ~/.ssh/yubikey";
              packages = with pkgs; [
                nixfmt-rfc-style
                nixos-anywhere
                nixd
              ];
              name = "nix-dev-shell";

              shellHook = ''
                zsh
              '';

            };
          };
        }
      );

      return = set1 // set2;
    in
    return;
}
