{ config, pkgs, ... }:
{
	home.packages = with pkgs; [
		neovim
		claude-code
    neovide
	];

	xdg.configFile."nvim".source = ./nvim;
}
