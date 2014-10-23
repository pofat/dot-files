#!/bin/bash

JPG_PATH="/mnt/store/screen_shots/$(date +%Y%m%d%H%M%S).jpg"
import -w root "$JPG_PATH"

export ICON="${HOME}/.sh/emblem-camera.png"
export ICON_SIZE=64

if [[ "$?" -eq 0 ]]; then
  env \
    PMPT_TEXT="Captured: ${JPG_PATH}" \
    ~/.sh/nautify.sh
  play -q "/usr/share/sounds/freedesktop/stereo/camera-shutter.oga"
else
  env \
    PMPT_TEXT="Error: failed to capture a screen." \
    ~/.sh/nautify.sh
fi
