CODE_DIR=${GOPATH}/src

function aur() {
  cd ${CODE_DIR}/aur.archlinux.org/$1
}

function bitbucket() {
  cd ${CODE_DIR}/bitbucket.org/$1
}

function github() {
  cd ${CODE_DIR}/github.com/$1
}

function gitlab() {
  cd ${CODE_DIR}/gitlab.com/$1
}
