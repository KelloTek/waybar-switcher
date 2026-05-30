# 🔄 Waybar Switcher

A simple CLI tool to switch between multiple Waybar configurations using fzf.

## 📦 Dependencies

- `fzf`
- `curl`
- `pkill`
- `waybar`
- `uwsm-app` (Optional, required for some compositors like Hyprland + UWSM)

## ⚙️ How it works

- Configurations are stored in: `~/.config/waybar-configs/`, one subdirectory per config
- The tool symlinks `~/.config/waybar` -> selected config
- Waybar is restarted automatically after switching
- On first run, if `~/.config/waybar-configs/` doesn't exist, the current config is saved as `Default`

## 🚀 Installation

```bash
curl -fsSL https://raw.githubusercontent.com/KelloTek/waybar-switcher/main/install.sh | bash
```

## 📁 Setup

Place each Waybar config as subdirectory inside `~/.config/waybar-configs/`:

```
~/.config/waybars/
├── Default/
│   ├── config
│   └── style.css
├── Minimal/
│   ├── config
│   └── style.css
└── Tokyo-Night/
│   ├── config
│   └── style.css
```

## ▶️ Usage

| Command                  | Description                            |
|--------------------------|----------------------------------------|
| `waybar-switcher`        | Open interactive config picker          |
| `waybar-switcher update` | Update to the latest release           |
| `waybar-switcher help`   | Show help                              |

## 🖥️ Compatibility

Tested on [omarchy](https://omarchy.org) (Arch Linux).
Other Arch-based distros should work. Feedback welcome for other distributions.