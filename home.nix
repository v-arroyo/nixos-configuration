{ config, pkgs, ... }



{
	home.username = "victoria";
	home.homeDirectory = "/home/tony";
	programs.git.enable = true;
	home.stateVersion = "25.06";
	programs.basg = {
		enable = true;
		shellAliases = 
			btw = "echo I use nixos, btw";
	};
    };
};
