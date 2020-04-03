containers/install:
  pkg.installed:
    - pkgs:
      - buildah
      - crun
      - docker
      - docker-compose
      - docker-compose-driver-kvm2
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
    - content: {{ grains.user }}:100000:65536

containers/{{ grains.user }}/rootless/gid:
  file.managed:
    - name: /etc/subgid
    - content: {{ grains.user }}:100000:65536


containers/podman/crun:
  file.managed:
    - name: {{ grains.homedir }}/.config/containers/libpod.conf
    - content: runtime = 'crun'
    - user: {{ grains.user }}
