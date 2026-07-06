{ config, pkgs, inputs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."etanheinmik" = {
    isNormalUser = true;
    description = "Evan McPheron";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };
}
