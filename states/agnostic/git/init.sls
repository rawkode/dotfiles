git:
  pkg.installed

git-config:
  file.managed:
    - name: {{ grains.homedir }}/.gitconfig
    - source: salt:///git/config
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - force: True

git-ignore:
  file.managed:
    - name: {{ grains.homedir }}/.gitignore
    - source: salt:///git/ignore
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - force: True

git-templates-dir:
  file.directory:
    - name: {{ grains.homedir }}/.git/templates
    - makedirs: True
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - force: True

git-commit:
  file.managed:
    - name: {{ grains.homedir }}/.git/templates/commit
    - source: salt:///git/templates/commit.txt
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - force: True
