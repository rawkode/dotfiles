include:
    - .{{ grains.os_family | lower }}

docker/install:
  pkg.installed:
    - name: docker

docker/service:
  service.running:
    - name: docker
    - enable: True

docker-compose:
  pkg.installed
