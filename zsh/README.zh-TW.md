# Zsh 設定

*本文的 [English](README.md) 版本。*

[Zsh](https://www.zsh.org) shell 的設定，由 [Zim](https://zimfw.sh) 框架驅動（一個快速、
模組化的外掛管理工具）。你第一次開啟 shell 時，Zim 會自動安裝自己——不需要你手動設定。

## 檔案

| 檔案 | 安裝到 | 用途 |
| --- | --- | --- |
| `dot.zshenv` | `~/.zshenv` | **每個** shell 都會載入；為後續一切鋪路 |
| `dot.zprofile` | `~/.zprofile` | 僅登入 shell；設定 Homebrew 與 `umask` |
| `dot.zshrc` | `~/.zshrc` | 互動式 shell；載入下方的 `zshrc.d/` 片段 |
| `dot.zlogin` / `dot.zlogout` | `~/.zlogin` / `~/.zlogout` | 登入／登出時執行 |
| `dot.zimrc` | `~/.zimrc` | 要載入哪些 Zim 模組（外掛） |
| `dot.p10k.zsh` | `~/.p10k.zsh` | Powerlevel10k 提示字元主題設定 |
| `dot.zshrc.d/` | `~/.zshrc.d/` | 模組化、一個工具一個檔案的設定（見下方） |
| `dot.*.local` | `~/.*.local` | 你的個人、各機器專用的覆寫（不存在時才複製） |
| `link.sh` | — | 這個資料夾的安裝程式 |

## 安裝

在 repo 根目錄執行 `make links`，或只跑這個資料夾：

```sh
sh zsh/link.sh
```

之後請開一個新的終端機。首次啟動時 Zim 會下載自己以及 `~/.zimrc` 裡列出的所有模組，請稍等一下。

## Zsh 啟動檔案如何搭配

Zsh 會依固定順序讀取設定檔。簡化如下：

```
.zshenv   →  .zprofile（登入）  →  .zshrc（互動式）  →  .zlogin（登入）
```

有趣的部分發生在 **`.zshrc`**，它會依檔名順序載入 `~/.zshrc.d/` 裡的每個片段。

## `dot.zshrc.d/` 拖放資料夾

設定不是塞進一個巨大的 `.zshrc`，而是拆成一個個依序載入的小型編號檔案。這讓一切保持整潔——
要新增一個工具，只要丟進一個新檔案即可。

| 檔案 | 設定的對象 |
| --- | --- |
| `00-init.zsh` | 核心 shell 選項 |
| `01-zimfw.zsh` | 載入 Zim 框架 |
| `02-compinit.zsh` | Tab 補全 |
| `03-prompt-p10k.zsh` / `03-prompt-starship.zsh` | 提示字元（見下方） |
| `10-locale.zsh`、`11-alias.zsh`、`12-path.zsh` | 語系、別名、`PATH` |
| `20-misc.zsh` | 其他雜項 |
| `bun.zsh`、`go.zsh`、`rust.zsh`、`mise.zsh`、`zoxide.zsh`… | 每個開發工具各一個檔案 |

數字控制載入順序；兩位數前綴的檔案會在無前綴的工具檔案之前執行。

## 選擇提示字元

在 `~/.zshenv.local` 裡設定 `ZSH_PROMPT` 來挑選你的提示字元：

```sh
ZSH_PROMPT=p10k       # Powerlevel10k
# ZSH_PROMPT=starship  # Starship（主題見 ../starship）
```

不設定它則會退回一個簡單的內建提示字元。如果你選 `starship`，請見
[starship README](../starship) 了解如何選擇主題。
