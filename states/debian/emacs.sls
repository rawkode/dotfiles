emacs-ppa:
  pkgrepo.managed:
    - humanname: Emacs PPA
    - name: ppa:kelleyk/emacs
    - keyid: EAAFC9CD
    - keyserver: keyserver.ubuntu.com


emacs-install:
  pkg.installed:
    - require:
      - pkgrepo: emacs-ppa
    - name: emacs25-nox
    - refresh: True
