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
}
