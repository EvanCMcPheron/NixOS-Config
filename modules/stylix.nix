{ pkgs, lib, inputs, ... }:
{
  disabledModules = [ 
    "${inputs.stylix}/modules/kmscon/nixos.nix" 
  ];

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";
    image = ../wallpapers/dark.jpg;

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

  environment.etc."current-theme".text = "dark";

  specialisation.day.configuration = {
    environment.etc."current-theme".text = lib.mkForce "light";
    stylix = {
      polarity = lib.mkForce "light";
      base16Scheme = lib.mkForce "${pkgs.base16-schemes}/share/themes/rose-pine-dawn.yaml";
      image = lib.mkForce ../wallpapers/light.jpg;
    };
  };
}
