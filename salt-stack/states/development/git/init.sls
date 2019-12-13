git-hub-install:
  pkg.installed:
    - name: hub

git-config:
  file.managed:
    - name: {{ grains.homedir }}/.config/git/config
    - makedirs: True
    - source: salt://{{ slspath }}/files/config
    - user: {{ grains.user }}
    - force: True

git-ignore:
  file.managed:
    - name: {{ grains.homedir }}/.gitignore
    - source: salt://{{ slspath }}/files/ignore
    - user: {{ grains.user }}
    - force: True

git-templates-dir:
  file.directory:
    - name: {{ grains.homedir }}/.git/templates
    - makedirs: True
    - user: {{ grains.user }}
    - force: True

git-commit:
  file.managed:
    - name: {{ grains.homedir }}/.git/templates/commit
    - source: salt://{{ slspath }}/files/templates/commit.txt
    - user: {{ grains.user }}
    - force: True
