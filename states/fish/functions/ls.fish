function ls
    set -q argv[1]
    or set argv[1] "."

    exa $argv[1]
end
