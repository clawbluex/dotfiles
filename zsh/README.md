# Zsh config

*Read this in [繁體中文](README.zh-TW.md).*

Configuration for the [Zsh](https://www.zsh.org) shell, powered by the
[Zim](https://zimfw.sh) framework (a fast, modular plugin manager). Zim installs itself
automatically the first time you open a shell — you don't need to set it up by hand.

## Files

| File | Installs to | Purpose |
| --- | --- | --- |
| `dot.zshenv` | `~/.zshenv` | Loaded for **every** shell; sets the stage for everything else |
| `dot.zprofile` | `~/.zprofile` | Login shells only; sets up Homebrew and `umask` |
| `dot.zshrc` | `~/.zshrc` | Interactive shells; loads the `zshrc.d/` snippets below |
| `dot.zlogin` / `dot.zlogout` | `~/.zlogin` / `~/.zlogout` | Run at login / logout |
| `dot.zimrc` | `~/.zimrc` | Which Zim modules (plugins) to load |
| `dot.p10k.zsh` | `~/.p10k.zsh` | Powerlevel10k prompt theme settings |
| `dot.zshrc.d/` | `~/.zshrc.d/` | Modular, one-file-per-tool config (see below) |
| `dot.*.local` | `~/.*.local` | Your personal, machine-specific overrides (copied only if missing) |
| `link.sh` | — | The installer for this folder |

## Install

From the repo root run `make links`, or just this folder:

```sh
sh zsh/link.sh
```

Open a new terminal afterwards. On first launch Zim downloads itself and all the modules
listed in `~/.zimrc`, so give it a moment.

## How Zsh startup files fit together

Zsh reads its config files in a set order. Simplified:

```
.zshenv   →  .zprofile (login)  →  .zshrc (interactive)  →  .zlogin (login)
```

The interesting work happens in **`.zshrc`**, which loads every snippet in
`~/.zshrc.d/` in filename order.

## The `dot.zshrc.d/` drop-in folder

Instead of one giant `.zshrc`, settings are split into small numbered files that load in
order. This keeps things tidy — add a new tool by dropping in a new file.

| File | Sets up |
| --- | --- |
| `00-init.zsh` | Core shell options |
| `01-zimfw.zsh` | Loads the Zim framework |
| `02-compinit.zsh` | Tab completion |
| `03-prompt-p10k.zsh` / `03-prompt-starship.zsh` | The prompt (see below) |
| `10-locale.zsh`, `11-alias.zsh`, `12-path.zsh` | Locale, aliases, `PATH` |
| `20-misc.zsh` | Miscellaneous extras |
| `bun.zsh`, `go.zsh`, `rust.zsh`, `mise.zsh`, `zoxide.zsh`, … | One file per dev tool |

Numbers control load order; the two-digit prefixes run before the unprefixed tool files.

## Choosing a prompt

Set `ZSH_PROMPT` in `~/.zshenv.local` to pick your prompt:

```sh
ZSH_PROMPT=p10k       # Powerlevel10k
# ZSH_PROMPT=starship  # Starship (see ../starship for themes)
```

Leaving it unset falls back to a simple built-in prompt. If you choose `starship`, see the
[starship README](../starship) for how to select a theme.
