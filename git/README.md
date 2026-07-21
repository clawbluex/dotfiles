# Git config

*Read this in [繁體中文](README.zh-TW.md).*

Global [Git](https://git-scm.com) settings: sensible defaults, colorful output, handy
aliases, and a shared ignore list.

## Files

| File | Installs to | Purpose |
| --- | --- | --- |
| `config` | `~/.config/git/config` (symlink) | The main settings: colors, aliases, diff/merge tools, [delta](https://github.com/dandavison/delta) integration |
| `ignore` | `~/.config/git/ignore` (symlink) | Files Git should ignore in **every** repo (`.DS_Store`, build output, etc.) |
| `dot.gitconfig` | `~/.gitconfig` (copied if missing) | A tiny starter file where you put your **name and email** |
| `link.sh` | — | The installer for this folder |

## Requirements

This config uses [delta](https://github.com/dandavison/delta) to render diffs. Install it
first, or `link.sh` will stop with an error:

```sh
brew install git-delta      # macOS
sudo apt-get install git-delta   # Debian/Ubuntu
```

## Install

From the repo root run `make links`, or just this folder:

```sh
sh git/link.sh
```

Then open `~/.gitconfig` and add your identity:

```ini
[user]
    name = Your Name
    email = you@example.com
```

## Handy aliases

The `config` file defines many shortcuts. A few you'll use daily:

| Alias | Runs | Does |
| --- | --- | --- |
| `git st` | `status` | Show working-tree status |
| `git co` | `checkout` | Switch branches / restore files |
| `git sw` | `switch` | Switch branches (newer syntax) |
| `git glog` | pretty `log --graph` | A readable commit graph |
| `git hist` | decorated graph log | Compact history with dates and authors |
| `git dr` | word-level `diff` | Highlight changed words, not whole lines |

Open [`config`](config) to see the full list.
