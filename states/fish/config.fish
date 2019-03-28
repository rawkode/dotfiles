set DEFAULT_USER rawkode

if not functions -q fisher
    set -q XDG_CONFIG_HOME
    or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

set -g ANDROID_SDK_ROOT "/usr/local/share/android-sdk"
set -gx PATH $HOME/.cargo/bin $HOME/Code/bin $HOME/.composer/vendor/bin /usr/local/opt/flutter/bin $ANDROID_SDK_ROOT/tools/bin $PATH

gpg-connect-agent killagent /bye
gpg-connect-agent /bye

gpgconf --launch gpg-agent

set -x GPG_TTY (tty)
set -x SSH_AUTH_SOCK ~/.gnupg/S.gpg-agent.ssh
