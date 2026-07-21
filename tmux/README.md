# tmux config

*Read this in [繁體中文](README.zh-TW.md).*

Configuration for [tmux](https://github.com/tmux/tmux), a terminal multiplexer — it lets
you split one terminal window into multiple panes and keep sessions running in the
background.

## Files

| File | Installs to | Purpose |
| --- | --- | --- |
| `dot.tmux.conf` | `~/.tmux.conf` (symlink) | The main tmux config |
| `dot.tmux.conf.local` | `~/.tmux.conf.local` (copied if missing) | Your personal tweaks — safe from being overwritten |
| `link.sh` | — | The installer for this folder |

## Requirements

```sh
brew install tmux
```

## Install

From the repo root run `make links`, or just this folder:

```sh
sh tmux/link.sh
```

On first run, `link.sh` also downloads the [Catppuccin](https://github.com/catppuccin/tmux)
theme into `~/.config/tmux/plugins/`.

## Good to know

- **Prefix key is `Ctrl-a`** (instead of the default `Ctrl-b`). Every tmux command starts
  with the prefix — for example, `Ctrl-a` then `c` opens a new window.
- Windows and panes are numbered from **1** (not 0), so they line up with your keyboard.
- Mouse support is **off** by default. Toggle it on with `Ctrl-a` then `m` (and off with
  `Ctrl-a` then `M`).
- Put your own overrides in `~/.tmux.conf.local` — the installer created it for you and
  won't touch it again.

See [`dot.tmux.conf`](dot.tmux.conf) for the full set of key bindings.
