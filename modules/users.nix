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

  users.users.claude-code = {
    isSystemUser = true;
    group = "claude-code";
    # Add groups your main user is in for read access
    extraGroups = [ "users" "audio" "video" ]; # mirror your own groups as needed
    shell = pkgs.bash;
  };
  users.groups.claude-code = {};
}
