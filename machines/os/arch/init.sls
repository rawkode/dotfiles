include:
  - os.arch.plymouth

go:
  pkg.installed

yay/clone:
  git.cloned:
    - name: https://aur.archlinux.org/yay-bin.git
    - target: {{ grains.homedir }}/Code/src/aur.archlinux.org/yay
    - branch: master
    - user: {{ grains.user }}

yay/install:
  cmd.run:
    - name: makepkg -si --noconfirm
    - cwd: {{ grains.homedir }}/Code/src/aur.archlinux.org/yay
    - runas: {{ grains.user }}

rawkode:
  user.present:
    - fullname: David McKay
    - remove_groups: False
    - groups:
      - input
      - users
      - wheel

bluetooth:
  service.running:
    - enable: True
    - reload: True
