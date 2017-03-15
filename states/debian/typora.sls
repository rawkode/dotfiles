typora-ppa:
  pkgrepo.managed:
    - humanname: Atom PPA
    - name: deb https://typora.io linux/
    - file: /etc/apt/sources.list.d/typora.list
    - keyid: BA300B7755AFCFAE
    - keyserver: keyserver.ubuntu.com

typora-install:
  pkg.latest:
    - require:
      - pkgrepo: typora-ppa
    - name: typora
    - refresh: True
