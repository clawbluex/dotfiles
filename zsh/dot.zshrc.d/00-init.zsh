# -----------------
# Zsh configuration
# -----------------

# man zshoptions

#
# History
#

# save the history to the disk for the commands we have typed
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000

setopt EXTENDED_HISTORY       # Write the history file in the ":start:elapsed;command" format.
setopt HIST_FIND_NO_DUPS      # Do not display a line previously found.
setopt HIST_IGNORE_DUPS       # Don't record an entry that was just recorded again.
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries in the history file.
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate.
setopt HIST_REDUCE_BLANKS     # remove superfluous blanks from history items
setopt INC_APPEND_HISTORY     # Write to the history file immediately, not when the shell exits.
setopt NO_SHARE_HISTORY
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording entry.
#setopt BANG_HIST              # Treat the '!' character specially during expansion.
#setopt SHARE_HISTORY          # Share history between all sessions.
#setopt HIST_IGNORE_SPACE      # Don't record an entry starting with a space.
#setopt HIST_VERIFY            # Don't execute immediately upon history expansion.
#setopt HIST_BEEP              # Beep when accessing nonexistent history.

#
# Changing Directories
#

setopt AUTO_CD # cd by typing directory name if it's not a command
setopt EXTENDED_GLOB

#
# Completion
#

#setopt AUTO_LIST # automatically list choices on ambiguous completion
setopt AUTO_MENU # automatically use menu completion
setopt ALWAYS_TO_END # move cursor to end if word had one match

#
# Input/output
#

#setopt CORRECT_ALL # autocorrect commands

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

