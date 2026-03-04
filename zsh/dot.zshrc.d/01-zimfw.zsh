# -----------------
# Zim configuration
# -----------------

# Disable version check
zstyle ':zim' disable-version-check yes

# Use degit instead of git as the default tool to install and update modules.
zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

#
# set fpath for zsh-completions
#
[[ -d /usr/local/share/zsh-completions ]] && fpath+=/usr/local/share/zsh-completions
[[ -d /opt/homebrew/share/zsh-completions ]] && fpath+=/opt/homebrew/share/zsh-completions
[[ -d ~/.zsh_completions ]] && fpath=(~/.zsh_completions $fpath)

#
# zim completion
#

# Uncomment the following line(s) to use case-sensitive completion.
# 1. set just completions to be case sensitive
#zstyle ':zim:completion' case-sensitivity sensitive
# 2. set just globbing to be case sensitive
#zstyle ':zim:glob' case-sensitivity sensitive
# 3. set both to be case sensitive
#zstyle ':zim:*' case-sensitivity sensitive

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
	echo "Downloading zimfw ..."
	if (( ${+commands[curl]} )); then
		curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
			https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
	else
		mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
			https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
	fi
fi

# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
	echo "Install missing modules and update settings ..."
	source ${ZIM_HOME}/zimfw.zsh init -q
fi

# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------
setopt NO_SHARE_HISTORY
unsetopt SHARE_HISTORY # zimfw will use sharehistory by default

#
# zsh-history-substring-search
#

HISTORY_SUBSTRING_SEARCH_PREFIXED=true
zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
