{ config, pkgs, ... }:
{
	home.packages = with pkgs; [
		neovim
		claude-code
	];

	xdg.configFile."nvim".source = ./nvim;
}
