#!/usr/bin/env bash
# Counterpart to brightness-dim.sh; see that file for why we don't use
# ambxst's own `brightness -r`.
saved=/tmp/ambxst_brightness_manual_saved.txt
[ -f "$saved" ] && ambxst brightness -s "$(cat "$saved")"
