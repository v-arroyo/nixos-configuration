{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
    home-manager = {
	url = "github:nix-community/home-manager/release-25.11";
	inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixos.Configurations.nixos-btw = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	modules = [ 
		./configuration.nix
		home-manager.nixosModules.home-manager
		{
		    home-manager = {
			useGlobalPkgs = true;
			useUserPackages = true;
			users.victoria = import ./home.nix;
			backupFileExtension = "backup";
		    };
	         }  
	       ];
     };
  };
}
