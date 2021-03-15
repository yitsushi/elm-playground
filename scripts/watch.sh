#!/usr/bin/env sh

elmFiles=src/*.elm

while inotifywait -qqe modify ${elmFiles} public/index.html; do ./scripts/build.sh; done