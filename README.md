# Dotfiles

*Read this in [繁體中文](README.zh-TW.md).*

Personal configuration files ("dotfiles") for a macOS development environment.

**Dotfiles** are the small hidden files (their names start with a `.`, like `~/.zshrc`)
that programs read to remember your settings. Keeping them in one Git repo means you can
version them, share them, and set up a new machine in minutes.

This repo installs itself by creating **symlinks**: instead of copying files into your home
folder, it points `~/.zshrc`, `~/.tmux.conf`, etc. at the files kept here. Edit a file in
this repo and the change is live immediately.

## What's inside

| Folder / file | What it configures |
| --- | --- |
| [`git/`](git/) | Git settings, aliases, and a global ignore list |
| [`starship/`](starship/) | Ready-made themes for the [Starship](https://starship.rs) shell prompt |
| [`tmux/`](tmux/) | The [tmux](https://github.com/tmux/tmux) terminal multiplexer |
| [`zsh/`](zsh/) | The Zsh shell, powered by the [Zim](https://zimfw.sh) framework |
| `Makefile` | The installer — runs every folder's `link.sh` for you |

Each folder has its own `README.md` with the details.

## Requirements

- **macOS** with [Homebrew](https://brew.sh) (the scripts also work on Linux)
- `make`, `git`, and `zsh` (Zsh ships with macOS)

Some folders need extra tools. Install what you plan to use:

```sh
brew install git-delta   # nicer Git diffs (required by the git config)
brew install tmux         # terminal multiplexer
brew install starship     # optional prompt themes
brew install mise          # optional runtime/version manager used by zsh
```

## Install

> [!WARNING]
> Installing overwrites shell config in your home folder (`~/.zshrc`, `~/.tmux.conf`, …)
> with symlinks. **Back up any existing dotfiles first.**

```sh
git clone https://github.com/<your-username>/dotfiles.git ~/workspace/dotfiles
cd ~/workspace/dotfiles
make links
```

`make links` walks every subfolder and runs its `link.sh` script. Run `make help` to see
the available commands.

## How the naming works

Every folder follows the same two rules, so once you learn them the whole repo is
predictable:

- **`dot.<name>` → `~/.<name>` (symlink).** A file named `dot.zshrc` becomes `~/.zshrc`,
  linked back to this repo. Editing the repo file updates your live config.
- **`dot.<name>.local` → `~/.<name>.local` (safe copy).** Files ending in `.local` are for
  machine-specific tweaks (your name, secrets, one-off overrides). They are **copied only
  if they don't already exist**, so the installer never clobbers your personal edits. These
  local files are meant to stay on your machine, not in the repo.

Tool configs (git, starship, tmux) link into `~/.config/<tool>/` — the standard
[XDG config location](https://specifications.freedesktop.org/basedir-spec/latest/).

## License

Released under the [MIT License](LICENSE).
