wmail-ppa:
  pkgrepo.managed:
    - humanname: WMail PPA
    - name: ppa:atareao/wmail

wmail-install:
  pkg.latest:
    - name: wmail
    - refresh: True
    - require:
      - pkgrepo: wmail-ppa

