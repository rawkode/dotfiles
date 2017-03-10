install-fisherman:
  cmd.run:
    - name: curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
    - user: {{ grains.user }}

