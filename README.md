# Install

```bash
bash -c "`curl -fsSL https://raw.githubusercontent.com/edinhodzic/dotfiles/main/install.sh`"
```

## Personal Apps (Optional)

To install personal applications (WhatsApp, NordVPN, Philips Hue Sync, Sonos):

```bash
curl -fsSL https://raw.githubusercontent.com/edinhodzic/dotfiles/main/personal.sh | bash
```

Or manually run `./personal.sh` if you've cloned the repository.

## macOS Settings Backup

The dotfiles automatically backup your current macOS settings before making changes. To restore previous settings:

```bash
bash ~/.dotfiles-backup/20240115_143022/restore_defaults.sh
```

