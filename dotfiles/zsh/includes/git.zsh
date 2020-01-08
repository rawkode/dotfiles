##
# Will uncomment when I get the auto-complete for git and hub working
#
#alias git='hub'

zplugin ice wait lucid as"completion"
zplugin snippet https://git.kernel.org/pub/scm/git/git.git/plain/contrib/completion/git-completion.zsh

zplugin ice wait lucid as"completion"
zplugin snippet https://github.com/github/hub/raw/master/etc/hub.zsh_completion
