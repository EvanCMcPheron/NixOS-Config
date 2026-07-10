{ pkgs, lib, inputs, ... }:
{
  disabledModules = [ 
    "${inputs.stylix}/modules/kmscon/nixos.nix" 
  ];

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";
    image = ../wallpapers/green_cafe.jpg;

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.agave;
        name = "Agave Nerd Font Mono";
      };
      sizes = {
        terminal = 13;
        applications = 12;
      };
    };
  };
}
