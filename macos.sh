#!/bin/sh

echo ""
echo '----------------------------------------------------------------------'
echo 'MacOS (1/2): Creating backup of current settings before making changes'
echo '----------------------------------------------------------------------'

# Create backup directory with timestamp
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

echo "Backup directory: $BACKUP_DIR"

# Function to backup a specific default
backup_default() {
    local domain="$1"
    local key="$2"
    local description="$3"
    
    echo "Backing up: $description"
    
    # Try to read the current value
    current_value=$(defaults read "$domain" "$key" 2>/dev/null)
    
    if [ $? -eq 0 ]; then
        echo "defaults write \"$domain\" \"$key\" \"$current_value\"" >> "$BACKUP_DIR/restore_defaults.sh"
        echo "$description: $current_value" >> "$BACKUP_DIR/current_values.txt"
    else
        echo "# $description was not set" >> "$BACKUP_DIR/restore_defaults.sh"
        echo "$description: (not set)" >> "$BACKUP_DIR/current_values.txt"
    fi
}

# Backup current settings
backup_default "NSGlobalDomain" "AppleInterfaceStyle" "Dark Mode"
backup_default "NSGlobalDomain" "com.apple.trackpad.scaling" "Trackpad sensitivity"
backup_default "com.apple.driver.AppleBluetoothMultitouch.trackpad" "Clicking" "Tap-to-click"
backup_default "NSGlobalDomain" "com.apple.mouse.tapBehavior" "Mouse tap behavior"
backup_default "com.apple.dock" "autohide" "Dock autohide"
backup_default "com.apple.dock" "wvous-tr-corner" "Hot corner top-right"
backup_default "com.apple.dock" "wvous-tr-modifier" "Hot corner top-right modifier"

# Make the restore script executable
chmod +x "$BACKUP_DIR/restore_defaults.sh"

echo "Backup completed: $BACKUP_DIR"

echo '---------------------------------------------'
echo 'MacOS (2/2): Overriding default MacOS options'
echo '---------------------------------------------'

# Things wanted in here but not quite working with defaults command
# - Enable three-finger drag
#   - defaults write com.apple.AppleMultitouchTrackpad "TrackpadThreeFingerDrag" -bool "false"
#   - defaults write com.apple.AppleMultitouchTrackpad "Dragging" -bool "false"


# Enable Dark Mode
defaults write NSGlobalDomain AppleInterfaceStyle Dark

# Increase trackpad sensitivity (0=slow, 3=fast)
defaults write NSGlobalDomain com.apple.trackpad.scaling -int 3

# Enable tap-to-click for trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Auto-hide dock
defaults write com.apple.dock autohide -bool true

# Enable hot corner (top-right) for screensaver
defaults write com.apple.dock wvous-tr-corner -int 5
defaults write com.apple.dock wvous-tr-modifier -int 0

echo ""
echo 'MacOS defaults applied!'
echo "To restore previous settings: bash \"$BACKUP_DIR/restore_defaults.sh\""
echo "NOTE: Some changes require logout/restart to take effect."
