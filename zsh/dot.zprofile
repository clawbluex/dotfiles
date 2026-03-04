# .zprofile
# loaded before .zshrc, for login shells only

# Set the "umask" (see "man umask"):
# umask 002 # relaxed   -rwxrwxr-x
# umask 022 # cautious  -rwxr-xr-x
# umask 027 # uptight   -rwxr-x---
# umask 077 # paranoid  -rwx------
# umask 066 # bofh-like -rw-------
umask 022

# Load local zprofile settings
[[ -r "$HOME/.zprofile.local" ]] && source "$HOME/.zprofile.local"
