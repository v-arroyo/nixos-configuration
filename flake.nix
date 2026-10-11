{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
	url = "github:nix-community/home-manager/master";
	inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    	nixosConfigurations = { 
	  nixos-btw = nixpkgs.lib.nixosSystem {
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
  };
}
