set DEFAULT_USER rawkode

if not functions -q fisher
    set -q XDG_CONFIG_HOME
    or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set SPACEFISH_PROMPT_ORDER time user dir host git package kubecontext exec_time line_sep battery jobs exit_code char
# set SPACEFISH_RPROMPT_ORDER

gpg-connect-agent killagent /bye
gpg-connect-agent /bye

gpgconf --launch gpg-agent
set -x GPG_TTY (tty)
set -x SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh
