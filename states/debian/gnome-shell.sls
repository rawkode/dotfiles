gnome3-ppa:
  pkgrepo.managed:
    - ppa: gnome3-team/gnome3-staging
    - keyid: 3B1510FD
    - keyserver: keyserver.ubuntu.com

gnome-shell-requirements:
  pkg.latest:
    - refresh: True
    - pkgs:
      - gnome-common
      - gnome-shell-extensions
      - nodejs
      - nodejs-legacy
      - npm

# Extensions now sync'd through GNOME's Google Chrome extension
