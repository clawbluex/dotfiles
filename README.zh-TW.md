# Dotfiles

*本文的 [English](README.md) 版本。*

macOS 開發環境的個人設定檔（「dotfiles」）。

**Dotfiles** 是那些檔名以 `.` 開頭的隱藏小檔案（例如 `~/.zshrc`），程式會讀取它們來記住
你的設定。把它們集中在一個 Git repo 裡，你就能為它們做版本控制、分享，並在幾分鐘內設定好一台
新機器。

這個 repo 透過建立**符號連結（symlink）**來安裝自己：它不是把檔案複製到你的家目錄，而是讓
`~/.zshrc`、`~/.tmux.conf` 等等指向這裡保存的檔案。你在這個 repo 裡編輯檔案，變更會立即生效。

## 內容一覽

| 資料夾 / 檔案 | 設定的對象 |
| --- | --- |
| [`git/`](git/) | Git 設定、別名（alias）與全域忽略清單 |
| [`starship/`](starship/) | 現成的 [Starship](https://starship.rs) shell 提示字元主題 |
| [`tmux/`](tmux/) | [tmux](https://github.com/tmux/tmux) 終端機多工器 |
| [`zsh/`](zsh/) | 由 [Zim](https://zimfw.sh) 框架驅動的 Zsh shell |
| `Makefile` | 安裝程式——會幫你執行每個資料夾的 `link.sh` |

每個資料夾都有自己的 `README.md`（以及 `README.zh-TW.md`）說明細節。

## 需求

- **macOS**，並安裝 [Homebrew](https://brew.sh)（這些腳本在 Linux 上也能運作）
- `make`、`git` 與 `zsh`（macOS 內建 Zsh）

有些資料夾需要額外工具，請依你要用的功能安裝：

```sh
brew install git-delta   # 更好看的 Git diff（git 設定必需）
brew install tmux         # 終端機多工器
brew install starship     # 選用的提示字元主題
brew install mise          # zsh 使用的選用執行環境／版本管理工具
```

## 安裝

> [!WARNING]
> 安裝會用符號連結覆蓋你家目錄中的 shell 設定（`~/.zshrc`、`~/.tmux.conf` …）。
> **請先備份既有的 dotfiles。**

```sh
git clone https://github.com/<your-username>/dotfiles.git ~/workspace/dotfiles
cd ~/workspace/dotfiles
make links
```

`make links` 會走訪每個子資料夾並執行它的 `link.sh` 腳本。執行 `make help` 可查看可用指令。

## 命名規則如何運作

每個資料夾都遵循同樣的兩條規則，所以一旦學會，整個 repo 都變得可預測：

- **`dot.<name>` → `~/.<name>`（符號連結）。** 名為 `dot.zshrc` 的檔案會變成 `~/.zshrc`，
  連回這個 repo。編輯 repo 裡的檔案就會更新你正在使用的設定。
- **`dot.<name>.local` → `~/.<name>.local`（安全複製）。** 以 `.local` 結尾的檔案是給
  各機器專用的微調（你的名字、機密、一次性覆寫）。它們**只在不存在時才會被複製**，所以安裝
  程式絕不會覆蓋你的個人修改。這些 local 檔案應留在你的機器上，不進 repo。

工具設定（git、starship、tmux）會連結進 `~/.config/<tool>/`——這是標準的
[XDG 設定位置](https://specifications.freedesktop.org/basedir-spec/latest/)。

## 授權

以 [MIT 授權條款](LICENSE)釋出。
