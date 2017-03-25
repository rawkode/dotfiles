tmate-ppa:
  pkgrepo.managed:
    - ppa: tmate.io/archive
    - keyid: DFE89826
    - keyserver: keyserver.ubuntu.com

tmate-install:
  pkg.latest:
    - name: tmate
    - require:
      - pkgrepo: tmate-ppa
