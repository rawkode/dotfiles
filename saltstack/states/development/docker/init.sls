docker/install:
  pkg.installed:
    - name: docker

docker/service:
  service.running:
    - name: docker
    - enable: True

docker-compose:
  pkg.installed

user/{{ grains.user }}/groups/docker:
  user.present:
    - name: {{ grains.user }}
    - remove_groups: False
    - groups:
      - docker
