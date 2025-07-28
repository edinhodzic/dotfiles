# One And Done

The automatic setup that handles everything for you:

```bash
bash -c "`curl -fsSL https://raw.githubusercontent.com/edinhodzic/dotfiles/main/install.sh`"
```

# Your Turn

The manual security steps you need to complete:

Go to **System Preferences > Security & Privacy:**
- Enable FileVault (save recovery key securely)
- Enable Firewall

# Bonus Round

The optional personal apps you can install:

```bash
curl -fsSL https://raw.githubusercontent.com/edinhodzic/dotfiles/main/personal.sh | bash
```

Or manually run `./personal.sh` if you've cloned the repository.

# Pro Tip

Oh and by the way, the dotfiles automatically backup your current macOS settings before making changes. To restore previous settings:

```bash
bash ~/.dotfiles-backup/20240115_143022/restore_defaults.sh
```

If you love the new setup and are never looking back, zap those backup files:

```bash
rm -rf ~/.dotfiles-backup
```

# End Game

Apps are installed but you'll need to configure them manually:
- log into VPN provider
- set up antivirus
- sign into development tools
- regenerate ssh key for github
- import exported config from various `config/*` files, into their corresponding apps
- etc.
