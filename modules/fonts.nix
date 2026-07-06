{ config, pkgs, inputs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.agave
    nerd-fonts.symbols-only
  ];
}
