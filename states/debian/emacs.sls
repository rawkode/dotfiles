ppa:
  pkgrepo.managed:
    - humanname: Emacs PPA
    - name: ppa:kelleyk/emacs

install:
  pkg.latest:
    - name: emacs25-nox
    - refresh: True
    - require:
      - pkgrepo: ppa

