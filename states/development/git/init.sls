git:
  pkg.installed

git/github-cli:
  aur.installed:
    - name: github-cli-bin

git/config/directory:
  file.directory:
    - name: {{ grains.homedir }}/.config/git
    - user: {{ grains.user }}

git/config:
  file.managed:
    - name: {{ grains.homedir }}/.config/git/config
    - source: salt://{{ slspath }}/files/git.config
    - user: {{ grains.user }}

git/ignores:
  file.managed:
    - name: {{ grains.homedir }}/.config/git/ignores
    - source: salt://{{ slspath }}/files/git.ignores
    - user: {{ grains.user }}
