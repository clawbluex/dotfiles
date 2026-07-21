# tmux 設定

*本文的 [English](README.md) 版本。*

[tmux](https://github.com/tmux/tmux) 的設定，tmux 是一個終端機多工器——它讓你把單一終端機
視窗切割成多個窗格，並讓工作階段在背景持續執行。

## 檔案

| 檔案 | 安裝到 | 用途 |
| --- | --- | --- |
| `dot.tmux.conf` | `~/.tmux.conf`（符號連結） | 主要的 tmux 設定 |
| `dot.tmux.conf.local` | `~/.tmux.conf.local`（不存在時才複製） | 你的個人微調——不會被覆蓋 |
| `link.sh` | — | 這個資料夾的安裝程式 |

## 需求

```sh
brew install tmux
```

## 安裝

在 repo 根目錄執行 `make links`，或只跑這個資料夾：

```sh
sh tmux/link.sh
```

首次執行時，`link.sh` 也會把 [Catppuccin](https://github.com/catppuccin/tmux) 主題下載到
`~/.config/tmux/plugins/`。

## 須知

- **前綴鍵是 `Ctrl-a`**（而非預設的 `Ctrl-b`）。每個 tmux 指令都以前綴鍵開頭——例如按
  `Ctrl-a` 再按 `c` 會開新視窗。
- 視窗與窗格從 **1** 開始編號（不是 0），這樣才會對齊你的鍵盤。
- 滑鼠支援預設**關閉**。按 `Ctrl-a` 再按 `m` 開啟（按 `Ctrl-a` 再按 `M` 關閉）。
- 把你自己的覆寫放進 `~/.tmux.conf.local`——安裝程式已幫你建立它，且之後不會再動它。

完整的按鍵綁定請見 [`dot.tmux.conf`](dot.tmux.conf)。
