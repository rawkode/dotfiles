function lt
    set -q argv[1]
    or set argv[1] ""

    exa --tree --level=2 $argv[1]
end
