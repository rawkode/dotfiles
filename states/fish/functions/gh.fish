function gh
    set -q argv[1]
    or set argv[1] ""

    cd $HOME/Code/src/github.com/$argv[1]
end

