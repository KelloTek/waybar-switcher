# 🔄 Waybar Switcher

A simple CLI tool to switch between multiple Waybar configurations using fzf.

## 📦 Dependencies

- `fzf`
- `curl`
- `pkill`
- `waybar`
- `uwsm-app` _(Optional, required for some compositors like Hyprland + UWSM)_

## ⚙️ How it works

- Configurations are stored in: `~/.config/waybar-configs/`, one subdirectory per config
- The tool symlinks `~/.config/waybar` -> selected config
- Waybar is restarted automatically after switching
- On first run, if `~/.config/waybar-configs/` doesn't exist, the current config is saved as `Default`

## 🚀 Installation

```bash
curl -fsSL https://raw.githubusercontent.com/KelloTek/waybar-switcher/refs/heads/main/install.sh | bash
```

## 📁 Setup

Place each Waybar config as subdirectory inside `~/.config/waybar-configs/`:

```
~/.config/waybars/
├── Default/
│   ├── config.jsonc
│   └── style.css
├── Minimal/
│   ├── config.jsonc
│   └── style.css
└── Tokyo-Night/
│   ├── config.jsonc
│   └── style.css
```

## ▶️ Usage

| Command                  | Description                            |
|--------------------------|----------------------------------------|
| `waybar-switcher`        | Open interactive config picker          |
| `waybar-switcher help`   | Show help                              |

If you want to use TUI on Omarchy use this command line:
```bash
bash -c 'waybar-switcher; sleep 1; exit; exec bash'
```

## 🗑️ Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/KelloTek/waybar-switcher/refs/heads/main/uninstall.sh | bash
```

Restores the currently active config as a real directory and removes the binary.
Your other configs in `~/.config/waybar-configs/` are left untouched.

## 🖥️ Compatibility

Tested on [Omarchy](https://omarchy.org) (Arch Linux).