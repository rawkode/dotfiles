base:
  '*':
    - setup
    - dotfiles

  'P@os_family:(Arch|Debian)':
    - packages

  'P@os_family:(Arch|Debian) and not G@virtual:LXC':
    - gnome-shell
