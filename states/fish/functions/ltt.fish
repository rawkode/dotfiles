function ltt
    set -q argv[1]
    or set argv[1] ""

    exa --tree --level=3 $argv[1]
end
