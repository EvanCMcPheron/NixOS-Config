{
  description = "Main Configuration Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs"; # locks inputs.nixpkgs to our nixpkgs url to ensure versioning consistancy
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {

    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {

        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nixos/

          home-manager.nixosModules.home-manager 
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.etanheinmik = import ./home.nix;
          }
        ];

      }
    };

  };

}
