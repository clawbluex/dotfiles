# Starship 提示字元主題

*本文的 [English](README.md) 版本。*

給 [Starship](https://starship.rs) shell 提示字元用的現成主題（「preset」）。Starship 會
繪製你在終端機中看到那條資訊豐富又好看的提示字元列。

## 檔案

每個主題都是一個 `.toml` 設定，並附有對應的 `.png` 預覽圖：

| 主題 | 設定檔 |
| --- | --- |
| Tokyo Night | `tokyo-night.toml` |
| Jetpack | `jetpack.toml` |
| Catppuccin Powerline | `catppuccin-powerline.toml` |
| Pastel Powerline | `pastel-powerline.toml` |
| 仿 Powerlevel10k | `p10k.toml` |

`link.sh` 會把所有主題連結進 `~/.config/starship/`。

## 預覽

### Tokyo Night
![Tokyo Night 主題](tokyo-night.png)

### Jetpack
![Jetpack 主題](jetpack.png)

### Catppuccin Powerline
![Catppuccin Powerline 主題](catppuccin-powerline.png)

### Pastel Powerline
![Pastel Powerline 主題](pastel-powerline.png)

## 需求

```sh
brew install starship
```

## 安裝

在 repo 根目錄執行 `make links`，或只跑這個資料夾：

```sh
sh starship/link.sh
```

## 選擇主題

Starship 會讀取 `STARSHIP_CONFIG` 環境變數所指向的設定檔：

```sh
export STARSHIP_CONFIG="$HOME/.config/starship/tokyo-night.toml"
```

如果你使用這個 repo 裡的 [`zsh/`](../zsh) 設定，就不需要手動設定它。只要在 `~/.zshenv.local`
裡告訴它要用哪個主題即可：

```sh
ZSH_PROMPT=starship              # 開啟 Starship 提示字元
ZSH_STARSHIP_PRESET=tokyo-night   # 或：jetpack、catppuccin-powerline、pastel-powerline、p10k、random
```

把 `ZSH_STARSHIP_PRESET=random` 設定起來，每次開新 shell 時都會隨機挑一個主題。
