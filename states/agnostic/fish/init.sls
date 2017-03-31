fish-fisherman-installed?:
  file.exists:
    - name: {{ grains.homedir }}/.config/fish/functions/fisher.fish

fish-fisherman:
  cmd.run:
    - name: curl -Lo {{grains.homedir }}/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
    - runas: {{ grains.user }}
    - onfail:
      - file: fish-fisherman-installed?
