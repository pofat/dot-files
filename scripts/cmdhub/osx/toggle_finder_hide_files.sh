if [[ "$(defaults read com.apple.Finder AppleShowAllFiles)" == "NO" ]]; then
  defaults write com.apple.Finder AppleShowAllFiles YES
else
  defaults write com.apple.Finder AppleShowAllFiles NO
fi

killall Finder
