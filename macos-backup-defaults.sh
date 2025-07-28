#!/bin/sh

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
        echo "# $description was not set (using system default)" >> "$BACKUP_DIR/restore_defaults.sh"
        echo "$description: [NOT SET - system default]" >> "$BACKUP_DIR/current_values.txt"
    fi
}

# Backup all the defaults we're going to change
backup_default "NSGlobalDomain" "AppleInterfaceStyle" "Dark Mode"
backup_default "NSGlobalDomain" "com.apple.trackpad.scaling" "Trackpad Sensitivity"
backup_default "com.apple.menuextra.battery" "ShowPercent" "Battery Percentage"
backup_default "com.apple.driver.AppleBluetoothMultitouch.trackpad" "TrackpadThreeFingerDrag" "Three-finger Drag"
backup_default "com.apple.driver.AppleBluetoothMultitouch.trackpad" "Clicking" "Tap-to-click"
backup_default "com.apple.dock" "autohide" "Dock Autohide"
backup_default "com.apple.dock" "wvous-tr-corner" "Hot Corner Top-Right"

# Make the restore script executable
chmod +x "$BACKUP_DIR/restore_defaults.sh"

echo ""
echo "Backup completed!"
echo "Backup location: $BACKUP_DIR"
echo "To restore: bash \"$BACKUP_DIR/restore_defaults.sh\""
echo "Current values: cat \"$BACKUP_DIR/current_values.txt\""
echo "" 