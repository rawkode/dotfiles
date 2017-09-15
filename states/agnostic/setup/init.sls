include:
  - ./users
  - {{ grains.os_family | lower }}: setup

base16-shell:
  git.latest:
    - name: https://github.com/chriskempson/base16-shell.git
    - target: {{ grains.homedir }}/.config/base16-shell
    
install-base-packages:
  pkg.installed:
    - pkgs:
      - asciinema
      - fish
      - gnome-tweak-tool
      - jq
      - tilix
      - tree
      - weechat
      - xclip
