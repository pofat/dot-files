#!/usr/bin/env bash
# cmdhub: Toggle Finder hiding files

if [[ "$(defaults read com.apple.Finder AppleShowAllFiles)" == "NO" ]]; then
  defaults write com.apple.Finder AppleShowAllFiles true
else
  defaults write com.apple.Finder AppleShowAllFiles false
fi
