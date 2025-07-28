echo '----------------------------------------------------------------------'
echo 'MacOS (1/2): Creating backup of current settings before making changes'
echo '----------------------------------------------------------------------'

BACKUP_DIR=$(./macos-backup-defaults.sh | grep "Backup directory:" | cut -d' ' -f3)

if [ -z "$BACKUP_DIR" ]; then
    echo "WARNING: Backup failed, but continuing with changes..."
    echo "You can manually backup with: ./macos-backup-defaults.sh"
else
    echo "Backup created: $BACKUP_DIR"
fi

echo '---------------------------------------------'
echo 'MacOS (2/2): Overriding default MacOS options'
echo '---------------------------------------------'

# Enable Dark Mode
defaults write NSGlobalDomain AppleInterfaceStyle Dark

# Increase trackpad sensitivity (0=slow, 3=fast)
defaults write NSGlobalDomain com.apple.trackpad.scaling -int 2

# Show battery percentage in menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Enable three-finger drag
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 1

# Enable tap-to-click for trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Auto-hide dock
defaults write com.apple.dock autohide -bool true

# Set top-right hot corner to start screensaver
defaults write com.apple.dock wvous-tr-corner -int 5

if [ -n "$BACKUP_DIR" ]; then
    echo ""
    echo "To restore previous settings: bash \"$BACKUP_DIR/restore_defaults.sh\""
fi

echo ""
echo "NOTE: Some changes require logout/restart to take effect."
