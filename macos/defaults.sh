echo 'setting macos defaults'
defaults write .GlobalPreferences AppleInterfaceStyle Dark
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults write com.apple.dock autohide -int 1

# top right hot corner starts screensaver
defaults write com.apple.dock wvous-tr-corner -int 5
