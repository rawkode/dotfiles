docker-ce-debian-repo:
  pkgrepo.managed:
    - humanname: Docker CE
    - name: deb [arch={{ grains['osarch'] }}] https://download.docker.com/linux/debian {{ grains['oscodename'] }} stable
    - file: /etc/apt/sources.list.d/docker-ce.list
    - key_url: https://download.docker.com/linux/debian/gpg

docker-ce-debian-install:
  pkg.installed:
    - name: docker-ce
