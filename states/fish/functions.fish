function fish_user_key_bindings
    bind \cm 'set -l cmd (commandline); test -z "$cmd"; and set -g _empty_command yes; or set -g _empty_command no; commandline -f execute'
end

function __autols_hook --description "Auto ls" --on-event fish_prompt
    if test "$__autols_last" != (pwd)
        or test "$_empty_command" = yes

        clear
        ls

        # Show git information, and if it's not a git repo, throw error
        # into /dev/null. Simples
        git status 2>/dev/null
    end
    set -g __autols_last (pwd)
end

function dc --wraps=docker-compose --description 'docker-compose alias'
    command docker-compose $argv
end

function k --wraps=kubectl --description 'kubectl alias'
    command kubectl $argv
end
