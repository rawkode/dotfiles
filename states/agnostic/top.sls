base:
  '*':
    # Install Docker first, so we can add the group to the user
    - docker
    - users
    - zsh
    - git
    - vim

#    'G@os_family:Arch':
    #     - arch/terminal
    #     - arch/docker
    #
    # '*':
    #     - agnostic/git
    #
    # 'G@os_family:Debian':
    #     - debian/docker
    #     - debian/X11
    #     - debian/i3
    #     - debian/xfce4
    #     - debian/GTK
    #     - debian/keybase
    #     - debian.htop
    #
    # 'G@os:MacOS':
    #     - osx
