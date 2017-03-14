google-chrome-ppa:
  pkgrepo.managed:
    - humanname: Google Chrome PPA
    - name: deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
    - file: /etc/apt/sources.list.d/google-chrome.list
    - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub

google-chrome-install:
  pkg.latest:
    - require:
      - pkgrepo: google-chrome-ppa
    - name: google-chrome-stable
    - skip_verify: True
    - refresh: True

