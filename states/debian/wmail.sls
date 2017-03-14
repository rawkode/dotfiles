wmail-ppa:
  pkgrepo.managed:
    - humanname: WMail PPA
    - name: ppa:atareao/wmail

wmail-install:
  pkg.latest:
    - require:
      - pkgrepo: wmail-ppa
    - name: wmail
    - refresh: True
