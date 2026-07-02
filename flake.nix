{
  description = "Main Configuration Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    nypkgs = {
      url = "github:yunfachi/nypkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs"; # locks inputs.nixpkgs to our nixpkgs url to ensure versioning consistanc
    };
  };

  outputs = { self, nixpkgs, home-manager, nypkgs, ... }@inputs:
  let 
    username = "etanheinmik";
    system = "x86_64-linux";
    ylib = nypkgs.lib.${system};
  in  {

    nixosConfigurations = {
      framework13 = nixpkgs.lib.nixosSystem {

        specialArgs = { 
          inherit inputs username system ylib;
        };
        modules = [
          ./hosts/framework13

          home-manager.nixosModules.home-manager 
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs username system ylib; };

            home-manager.users.${username} = import ./home;
          }
        ];
      };
    };
  };
}
