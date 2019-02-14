function ll
    set -q argv[1]
    or set argv[1] ""

    exa -l $argv[1]
end
