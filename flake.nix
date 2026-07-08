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

    nix-alien = {
      url = "github:thiagokokada/nix-alien";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };


  outputs = { self, nixpkgs, home-manager, nypkgs, ... }@inputs:
  let 
    username = "etanheinmik";
    system = "x86_64-linux";
    ylib = nypkgs.lib.${system};
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
    ];
  in  {

    nixosConfigurations = {

      framework13 = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs username system ylib; };
        modules = [
          ./hosts/framework13

          {
            nixpkgs.overlays = overlays;
          }

          home-manager.nixosModules.home-manager 
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs username system ylib; };

            home-manager.users.${username} = import ./home;
          }
        ] ++ ( ylib.umport{
				paths = [ ./modules ];
				recursive = true;
			} );
      };
    };
  };
}
