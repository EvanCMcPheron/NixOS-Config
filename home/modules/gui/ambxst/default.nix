# Pins Ambxst's runtime config (~/.config/ambxst/{config/*.json,binds.json}) to
# the copies checked into this directory. Ambxst has no NixOS/HM options for
# these — this is the only way to make its desktop config reproducible.
#
# theme.json is handled separately because its `lightMode` field must track
# stylix's polarity (see modules/stylix.nix's `day` specialisation): it's
# written by an activation script as a real mutable file rather than a
# symlink, since a specialisation swap retargets symlinks and may not
# reliably trigger Ambxst's file watcher.
#
# ~/.cache/ambxst/wallpapers.json holds Ambxst's own GUI-picked runtime state
# (color preset, current wallpaper, tint toggle) and is merged in place with
# jq rather than overwritten, so unrelated GUI-picked fields survive rebuilds.
# Two fields are pinned here to track stylix:
#   - activeColorPreset -> "Gruvbox", matching stylix's
#     gruvbox-dark-medium/gruvbox-light-medium base16Scheme (modules/stylix.nix)
#     so the shell isn't visually out of sync with the rest of the system.
#   - wallPath/currentWall -> stylix's own wallpaper (../../../../wallpapers),
#     so Ambxst's rendered background matches stylix's rather than staying on
#     whatever Ambxst's bundled example wallpaper was last picked. The
#     dark.jpg/light.jpg filename tracks config.stylix.polarity the same way
#     theme.json's lightMode does above (can't derive it from
#     config.stylix.image's basename: that path already carries its own Nix
#     store hash prefix, which doesn't match the filename inside this
#     separately-copied wallpapers directory).
#
# NOTE: pinning these means Ambxst's in-app settings GUI can no longer save
# changes for any file below — edits get reverted on the next rebuild. To
# change a setting, edit the JSON here and rebuild.
{ config, lib, pkgs, ... }:
let
  staticConfigs = [
    "bar" "compositor" "desktop" "dock" "lockscreen"
    "notch" "overview" "performance" "system" "workspaces"
  ];

  theme = (builtins.fromJSON (builtins.readFile ./config/theme.json)) // {
    lightMode = config.stylix.polarity == "light";
  };

  wallPath = "${../../../../wallpapers}";
  currentWall = "${wallPath}/${if config.stylix.polarity == "light" then "light.jpg" else "dark.jpg"}";
in
{
  xdg.configFile = lib.listToAttrs (map (name: {
    name = "ambxst/config/${name}.json";
    value.source = ./config + "/${name}.json";
  }) staticConfigs) // {
    "ambxst/binds.json".source = ./binds.json;
  };

  home.activation.ambxstTheme = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    run install -Dm644 ${pkgs.writeText "ambxst-theme.json" (builtins.toJSON theme)} \
      "$HOME/.config/ambxst/config/theme.json"
  '';

  home.activation.ambxstWallpaperState = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    cacheFile="$HOME/.cache/ambxst/wallpapers.json"
    run mkdir -p "$(dirname "$cacheFile")"
    if [ -f "$cacheFile" ]; then
      run ${pkgs.jq}/bin/jq \
        --arg wallPath "${wallPath}" \
        --arg currentWall "${currentWall}" \
        '.activeColorPreset = "Gruvbox" | .wallPath = $wallPath | .currentWall = $currentWall' \
        "$cacheFile" > "$cacheFile.tmp"
    else
      run ${pkgs.jq}/bin/jq -n \
        --arg wallPath "${wallPath}" \
        --arg currentWall "${currentWall}" \
        '{activeColorPreset: "Gruvbox", wallPath: $wallPath, currentWall: $currentWall}' \
        > "$cacheFile.tmp"
    fi
    run mv "$cacheFile.tmp" "$cacheFile"
  '';

  # Works around an Ambxst bug: AxctlService.qml never restarts the axctl
  # daemon if it dies (only warns), while it retries `axctl subscribe` every
  # 1s forever, spamming JSON-parse errors into a dead socket. See
  # ../hypr/scripts/axctl-watchdog.sh for the fix, which only starts a
  # daemon when none is already alive so it can't race Ambxst's own.
  systemd.user.services.axctl-watchdog = {
    Unit.Description = "Restart axctl daemon if Ambxst's own supervision missed it";
    Service = {
      Type = "oneshot";
      ExecStart = "${config.home.homeDirectory}/.config/hypr/scripts/axctl-watchdog.sh";
    };
  };

  systemd.user.timers.axctl-watchdog = {
    Unit.Description = "Periodically check the axctl daemon is alive";
    Timer = {
      OnStartupSec = "30s";
      OnUnitActiveSec = "30s";
    };
    Install.WantedBy = [ "timers.target" ];
  };
}
