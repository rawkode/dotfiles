function fish_user_key_bindings
    bind \cm 'set -l cmd (commandline); test -z "$cmd"; and set -g _empty_command yes; or set -g _empty_command no; commandline -f execute'
end