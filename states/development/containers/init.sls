containers/install:
  aur.installed:
    - names:
      - buildah
      - crun
      - docker
      - docker-compose
      - docker-machine-driver-kvm2
      - kaniko
      - podman
      - skopeo

containers/docker/service:
  service.running:
    - name: docker
    - enable: True
    - reload: True

containers/docker/{{ grains.user }}/group:
  user.present:
    - name: {{ grains.user }}
    - remove_groups: False
    - groups:
      - docker

containers/{{ grains.user }}/rootless/uid:
  file.managed:
    - name: /etc/subuid
    - contents: {{ grains.user }}:100000:65536

containers/{{ grains.user }}/rootless/gid:
  file.managed:
    - name: /etc/subgid
    - contents: {{ grains.user }}:100000:65536


containers/podman/crun:
  file.managed:
    - name: {{ grains.homedir }}/.config/containers/libpod.conf
    - contents: runtime = 'crun'
    - user: {{ grains.user }}
