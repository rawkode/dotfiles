##
# Plugins
##
zplugin ice silent wait"0"
zplugin snippet OMZ::plugins/history/history.plugin.zsh

zplugin ice silent wait"0"
zplugin snippet OMZ::plugins/per-directory-history/per-directory-history.zsh

zplugin ice silent wait"0"
zplugin light zdharma/history-search-multi-word

zplugin ice silent wait"0" pick"zsh-history-substring-search.zsh"
zplugin load "zsh-users/zsh-history-substring-search"

##
# Configuration
##
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd..:zh"

# Treat the '!' character specially during expansion.
setopt BANG_HIST

# Write the history file in the ":start:elapsed;command" format.
setopt EXTENDED_HISTORY

# Write to the history file immediately, not when the shell exits.
setopt INC_APPEND_HISTORY

# Share history between all sessions.
setopt NO_SHARE_HISTORY

# Expire duplicate entries first when trimming history.
setopt HIST_EXPIRE_DUPS_FIRST

# Don't record an entry that was just recorded again.
setopt HIST_IGNORE_DUPS

# Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_ALL_DUPS

# Do not display a line previously found.
setopt HIST_FIND_NO_DUPS

# Don't record an entry starting with a space.
setopt HIST_IGNORE_SPACE

# Don't write duplicate entries in the history file.
setopt HIST_SAVE_NO_DUPS

# Remove superfluous blanks before recording entry.
setopt HIST_REDUCE_BLANKS

# Don't execute immediately upon history expansion.
setopt HIST_VERIFY
