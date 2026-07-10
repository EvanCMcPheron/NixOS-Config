{ pkgs, ... }:
let
  themeToggle = pkgs.writeShellScriptBin "theme-toggle" ''
    set -euo pipefail
    BASE_STC="/run/current-system/bin/switch-to-configuration"
    DAY_STC="/run/current-system/specialisation/day/bin/switch-to-configuration"
    STATE_FILE="/etc/current-theme"

    current="dark"
    if [ -r "$STATE_FILE" ]; then
      current="$(cat "$STATE_FILE")"
    fi

    if [ "$current" = "light" ]; then
      echo "theme-toggle: switching to dark"
      exec sudo "$BASE_STC" test
    else
      echo "theme-toggle: switching to light"
      exec sudo "$DAY_STC" test
    fi
  '';
in
{
  environment.systemPackages = [ themeToggle ];

  security.sudo.extraRules = [
    {
      users = [ "etanheinmik" ];
      commands = [
        { command = "/run/current-system/bin/switch-to-configuration test"; options = [ "NOPASSWD" ]; }
        { command = "/run/current-system/specialisation/day/bin/switch-to-configuration test"; options = [ "NOPASSWD" ]; }
      ];
    }
  ];
}
