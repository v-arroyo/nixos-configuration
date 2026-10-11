{ config, pkgs, ... }:

{
	home.username = "victoria";
	home.homeDirectory = "/home/victoria";
	programs.git.enable = true;
	home.stateVersion = "26.05";
	programs.vim = {
		enable = true;
		extraConfig = ''
			set tabstop=4
			set shiftwidth=4
			set expandtab
		'';
	};
}
