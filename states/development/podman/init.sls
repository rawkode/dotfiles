include:
    - .{{ grains.os_family | lower }}

/etc/subuid:
  file.touch:
    - name: /etc/subuid

/etc/subgid:
  file.touch

userns-{{ grains.user }}:
  cmd.run:
    - name:  usermod -v 10000-65536 -w 10000-65536 {{ grains.user }}

podman/config/crun:
  file.line:
    - name: {{ grains.homedir }}/.config/containers/libpod.conf
    - mode: replace
    - match: runtime =
    - content: runtime = "crun"
    - user: {{ grains.user }}

podman/config/mount:
  file.line:
    - name: {{ grains.homedir }}/.config/containers/libpod.conf
    - mode: ensure
    - after: runtime =
    - content: mount_program = "/usr/bin/fuse-overlayfs"
    - user: {{ grains.user }}
