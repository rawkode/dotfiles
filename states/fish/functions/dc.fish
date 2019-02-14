function dc --wraps=docker-compose --description 'docker-compose alias'
    set -q argv[1]
    or set argv[1] ""

    docker-compose $argv[1]
end
