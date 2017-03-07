base:
  '*':
    # Install Docker first, so we can add the group to the user
    - docker
    - users
    - tmux
    - zsh
    - git
    - vim
    - GTK
    - fonts

