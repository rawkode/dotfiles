export GPG_TTY=$(tty)
export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
if _has gpg-agent; then
    eval "$(gpgconf --launch gpg-agent)"
    echo UPDATESTARTUPTTY | gpg-connect-agent 1>/dev/null
fi

# If the SSH agent is running then add any keys.
if [ "$SSH_AUTH_SOCK" ] && [ $(ssh-add -l >| /dev/null 2>&1; echo $?) = 1 ]; then
    ssh-add
fi
