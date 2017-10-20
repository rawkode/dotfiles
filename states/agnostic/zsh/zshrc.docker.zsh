## Elixir
function elixir() {
  run_with_docker "elixir" "latest" "elixir" $@
}

function iex() {
  run_with_docker "elixir" "latest" "iex" $@
}

function mix() {
  run_with_docker "elixir" "latest" "mix" $@
}

## PHP
function php() {
  run_with_docker "php" "7-cli" "php" $@
}

## JS/Node
function node() {
  run_with_docker "node" "latest" "node" $@
}

function hugo() {
  run_with_docker "publysher/hugo" "latest" "hugo" $@
}

## Markdown
function mdv() {
  docker run --rm -u $UID -v $PWD:/sandbox -w /sandbox -it rawkode/mdv:latest $@
}

## PlantUML
function plantuml() {
  cat $@ | docker run --rm -u $UID -i think/plantuml -tpng
}
