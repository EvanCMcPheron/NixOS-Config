{ config, pkgs, ... }:
{
	xdg.configFile."hypr".source = ./hypr;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them
    kdePackages.kate
    google-chrome
    ghostty
    kitty
    lazygit
    fish
    waybar
    wofi
    hypridle
    hyprlock
    hyprpaper
    hyprshot
    firefox
    adwaita-icon-theme
    brightnessctl
  ];
}
