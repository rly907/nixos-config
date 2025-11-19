{
    description = "w flakes only";
    inputs = {
        nixpkgs.url = "nixpkgs/nixos-25.05";
        home-manager = {
            url = "github:nix-community/home-manager/release-25.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = { self, nixpkgs, home-manager, ... }: {
        nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./configuration.nix
                home-manager.nixosModules.home-manager
                {
                    home-manager = {
			useGlobalPkgs = true;
			useUserPackages = true;
			users.rly907 = import ./home.nix;
			backupFileExtension = "backup";
                    };
                }
            ];
        };
    };
}
