{
  description = "Main Configuration Flake";


  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nypkgs = {
      url = "github:yunfachi/nypkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs"; # locks inputs.nixpkgs to our nixpkgs url to ensure versioning consistanc
    };

    nix-alien = {
      url = "github:thiagokokada/nix-alien";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };


  outputs = { self, nixpkgs, home-manager, nypkgs, ... }@inputs:
  let 
    username = "etanheinmik";
    system = "x86_64-linux";
    ylib = nypkgs.lib.${system};
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
      inputs.nix-cachyos-kernel.overlays.pinned
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

          inputs.stylix.nixosModules.stylix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
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
