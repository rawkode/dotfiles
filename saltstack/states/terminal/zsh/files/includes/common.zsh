LANGUAGE=en_GB.UTF-8
LC_ALL=en_GB.UTF-8
LC_CTYPE=en_GB.UTF-8
LC_ALL=en_GB.UTF-8

EDITOR="code"
PAGER=less
MANPAGER=less
MANWIDTH=${MANWIDTH:-80}
COLORTERM="yes"

# Treat pretty much everything as a word delimiter, which means Control-W stops on:
#  - / . , ^ - _, et al
WORDCHARS=''

# Report how long a command took, if it took more than a second
export REPORTTIME=5

# Enable color support of ls
if [[ "$TERM" != "dumb" ]]; then
  if [[ -x `which dircolors 2> /dev/null` ]]; then
    eval `dircolors -b`
  fi
fi

DIRSTACKSIZE=9
DIRSTACKFILE=~/.zdirs
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1] && cd $OLDPWD
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

# Allow midword case-insensitive completion
 zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
  '+l:|?=** r:|?=**'

setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
setopt PATH_DIRS           # Perform path search even on command names with slashes.
setopt AUTO_MENU           # Show completion menu on a successive tab press.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor

# You can cd into a directory by typing its name, no cd required
setopt AUTOCD
setopt autopushd pushdignoredups PUSHD_SILENT PUSHD_TO_HOME
