base:
  '*':
    - setup
    - dotfiles

  'P@os_family:(Arch|Debian)':
    - packages
