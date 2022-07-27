{
  description = "piotr flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-22.05";
    home-manager = {
	url = "github:nix-community/home-manager/release-22.05";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      lib = nixpkgs.lib;
      overlays = [
	inputs.neovim-nightly-overlay.overlay

        (final: prev: {
          # Go we always want the latest version
          go = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.go_1_18;

          # To get Kitty 0.24.x. Delete this once it hits release.
          kitty = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.kitty;
      	})
      ];
    in {
      nixosConfigurations = {
        piotr = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.piotr = {
                imports = [./home.nix ];
              };
            }
          ];
        };
      };
    };
}

