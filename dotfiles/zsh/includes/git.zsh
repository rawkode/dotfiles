alias git='hub'

# \git means it won't use my alias ^^
local git_version=$(\git --version | sed -e 's/git version /v/')
local hub_version=$(hub --version | tail -n 1 | sed -e 's/hub version /v/g')

##
# Getting an error with the "official" completions
#
# __git_zsh_cmd_all:3: command not found: __git_compute_all_commands
#
# zplugin ice wait lucid as"completion" mv'git-completion.zsh -> _git'
# zplugin snippet https://github.com/git/git/raw/${git_version}/contrib/completion/git-completion.zsh

zplugin ice wait lucid as"completion" mv'hub.zsh_completion -> _hub'
zplugin snippet https://github.com/github/hub/raw/${hub_version}/etc/hub.zsh_completion
