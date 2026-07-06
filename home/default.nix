{ config, pkgs, username, ylib, ... }:
{
  imports = ylib.umport {
    path = ./modules;
    recursive = true;
  };

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";
  };
  programs.home-manager.enable = true;

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  # xresources.properties = {
  #   "Xcursor.size" = 16;
  #   "Xft.dpi" = 172;
  # };


  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
}
