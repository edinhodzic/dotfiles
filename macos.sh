echo 'setting macos defaults'
defaults write .GlobalPreferences AppleInterfaceStyle Dark
defaults write NSGlobalDomain com.apple.trackpad.scaling -int 2
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults write com.apple.dock autohide -int 1

# top right hot corner starts screensaver
defaults write com.apple.dock wvous-tr-corner -int 5

# show date and day of the week in task bar
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM  HH:mm"
defaults write com.apple.menuextra.battery ShowPercent -string YES

# TODO change iterm > profiles > colors > preset to "Pastel (Dark Background)"
