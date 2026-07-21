# Git 設定

*本文的 [English](README.md) 版本。*

全域 [Git](https://git-scm.com) 設定：合理的預設值、彩色輸出、方便的別名，以及共用的忽略清單。

## 檔案

| 檔案 | 安裝到 | 用途 |
| --- | --- | --- |
| `config` | `~/.config/git/config`（符號連結） | 主要設定：顏色、別名、diff/merge 工具、[delta](https://github.com/dandavison/delta) 整合 |
| `ignore` | `~/.config/git/ignore`（符號連結） | Git 在**每個** repo 都該忽略的檔案（`.DS_Store`、編譯產物等） |
| `dot.gitconfig` | `~/.gitconfig`（不存在時才複製） | 一個放你的**姓名與 email** 的起始小檔案 |
| `link.sh` | — | 這個資料夾的安裝程式 |

## 需求

此設定使用 [delta](https://github.com/dandavison/delta) 來呈現 diff。請先安裝它，否則
`link.sh` 會因錯誤而停止：

```sh
brew install git-delta      # macOS
sudo apt-get install git-delta   # Debian/Ubuntu
```

## 安裝

在 repo 根目錄執行 `make links`，或只跑這個資料夾：

```sh
sh git/link.sh
```

接著打開 `~/.gitconfig` 填入你的身分：

```ini
[user]
    name = Your Name
    email = you@example.com
```

## 好用的別名

`config` 檔案定義了許多快捷指令。以下是幾個你每天都會用到的：

| 別名 | 實際執行 | 作用 |
| --- | --- | --- |
| `git st` | `status` | 顯示工作目錄狀態 |
| `git co` | `checkout` | 切換分支／還原檔案 |
| `git sw` | `switch` | 切換分支（較新的語法） |
| `git glog` | 美化的 `log --graph` | 易讀的 commit 圖 |
| `git hist` | 帶裝飾的圖形 log | 含日期與作者的精簡歷史 |
| `git dr` | 逐字的 `diff` | 標出變更的字詞，而非整行 |

打開 [`config`](config) 可看到完整清單。
