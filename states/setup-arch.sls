go:
  pkg.installed:
    - pkgs:
      - go

yay-directory:
  file.directory:
    - name: /opt/yay
    - user: {{ grains['user'] }}

yay-download-installer:
  git.latest:
    - name: https://aur.archlinux.org/yay.git
    - target: /opt/yay

yay-makepkg:
  cmd.run:
    - name: makepkg -i PKGBUILD --noconfirm
    - runas: {{ grains['user'] }}
    - cwd: /opt/yay

/etc/pacman.conf:
  file.uncomment:
    - regex: Color

# There's no point in ensuring that {{ grains.user }} has sudo access prior to removing
# the root password ... because sudo is needed to run these states
root:
  user.present:
    - name: root
    - empty_password: True

{% if grains.user != 'root' %}
group-{{ grains.user }}:
  group.present:
    - name: {{ grains.user }}

# Creating this saves us from having to install Docker before running setup state
group-docker:
  group.present:
    - name: docker

user-{{ grains.user }}:
  user.present:
    - name: {{ grains.user }}
    - shell: /usr/bin/zsh
    - remove_groups: False
    - groups:
      - {{ grains.user }}
      - docker
      - libvirt
{% endif %}
