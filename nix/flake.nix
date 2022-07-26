{
  description = "piotr flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-22.05";
    home-manager = {
	url = "github:nix-community/home-manager/release-22.05";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      lib = nixpkgs.lib;
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
    #  hmConfig = {
    #    piotr = home-manager.lib.homeManagerConfiguration {
    #      inherit system pkgs;
    #      username = "piotr";
    #      homeDirectory = "/home/piotr";
    #      stateVersion = "22.05";
    #      configuration = {
    #        imports = [
    #            ./home.nix
    #        ];
    #      };
    #  };
    #};
};
}

