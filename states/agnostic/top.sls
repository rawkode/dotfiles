base:
  '*':
    # Install Docker first, so we can add the group to the user
    - docker
    - users
    - zsh
    - git
    - vim
    - GTK
    - fonts
    - atom
    - X11
    - xfce4
    - i3
