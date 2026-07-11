{ pkgs, ... }:
let
  themeToggle = pkgs.writeShellScriptBin "theme-toggle" ''
    set -euo pipefail
    # Anchored on the persisted profile, not /run/current-system: activating a
    # specialisation via `test` makes /run/current-system BECOME that
    # specialisation's own closure (which has no nested specialisation of its
    # own), so a base path derived from /run/current-system after switching to
    # day would have no way back. /nix/var/nix/profiles/system only moves on a
    # real switch/boot, so it stays a stable reference to base either way.
    BASE_STC="/nix/var/nix/profiles/system/bin/switch-to-configuration"
    DAY_STC="/nix/var/nix/profiles/system/specialisation/day/bin/switch-to-configuration"
    STATE_FILE="/etc/current-theme"

    current="dark"
    if [ -r "$STATE_FILE" ]; then
      current="$(cat "$STATE_FILE")"
    fi

    if [ "$current" = "light" ]; then
      echo "theme-toggle: switching to dark"
      sudo "$BASE_STC" test
    else
      echo "theme-toggle: switching to light"
      sudo "$DAY_STC" test
    fi

    # Ghostty has no config file watcher (as of 1.3.1) but exposes a GTK
    # "reload-config" action over D-Bus that live-reloads every open window.
    ${pkgs.glib}/bin/gdbus call --session \
      --dest com.mitchellh.ghostty \
      --object-path /com/mitchellh/ghostty \
      --method org.gtk.Actions.Activate reload-config "[]" "{}" \
      >/dev/null 2>&1 || true
  '';
in
{
  environment.systemPackages = [ themeToggle ];

  security.sudo.extraRules = [
    {
      users = [ "etanheinmik" ];
      commands = [
        { command = "/nix/var/nix/profiles/system/bin/switch-to-configuration test"; options = [ "NOPASSWD" ]; }
        { command = "/nix/var/nix/profiles/system/specialisation/day/bin/switch-to-configuration test"; options = [ "NOPASSWD" ]; }
      ];
    }
  ];
}
