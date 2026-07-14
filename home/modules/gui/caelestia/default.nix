{ config, pkgs, system, inputs, ... }:
{
  home.packages = with pkgs; [
    inputs.caelestia-shell.packages.${system}.default
  ];
}
