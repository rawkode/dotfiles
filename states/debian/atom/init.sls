atom-ppa:
    pkgrepo.managed:
        - humanname: Atom PPA
        - name: deb http://ppa.launchpad.net/webupd8team/atom/ubuntu xenial main
        - file: /etc/apt/sources.list.d/atom.list
        - keyid: EEA14886
        - keyserver: keyserver.ubuntu.com

atom-install:
    pkg.latest:
        - name: atom
        - refresh: True
        - require:
            - pkgrepo: atom-ppa


