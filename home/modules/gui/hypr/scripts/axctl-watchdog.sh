#!/usr/bin/env bash
# Restart axctl's daemon if Ambxst's own supervision missed it.
#
# AxctlService.qml spawns `axctl daemon` once at Ambxst startup with no
# restart logic if it dies (only a console.warn), while `axctl subscribe`
# retries every 1s forever. If the daemon dies, subscribe spins into a dead
# socket forever, spamming "AxctlService subscribe JSON parse error" and
# leaving the shell without window/workspace state until Ambxst is fully
# restarted. This only starts a daemon when none is already running, so it
# never races with Ambxst's own daemon process.
configPath="${XDG_DATA_HOME:-$HOME/.local/share}/ambxst/axctl.toml"

# -x/comm matching doesn't work here: Nix wraps the quickshell binary, so
# its comm name is truncated to ".quickshell-wra", not "quickshell". Match
# the full command line (which includes the ambxst-shell qml path) instead.
pgrep -f "quickshell.*ambxst-shell" >/dev/null || exit 0
pgrep -f "axctl -c .* daemon" >/dev/null && exit 0

systemd-run --user --unit="axctl-daemon-standin-$(date +%s)" --collect -- \
  axctl -c "$configPath" daemon
