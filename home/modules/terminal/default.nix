{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Evan McPheron";
    userEmail = "evancmcpheron@gmail.com";
  };
}
