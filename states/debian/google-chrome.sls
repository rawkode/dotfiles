google-chrome-ppa:
  pkgrepo.managed:
    - humanname: Google Chrome PPA
    - name: deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
    - file: /etc/apt/sources.list.d/google-chrome.list
    - keyurl: https://dl-ssl.google.com/linux/linux_signing_key.pub
    - require_in:
      - pkg: google-chrome

google-chrome:
  pkg.latest:
    - name: google-chrome-unstable
    - skip_verify: True
    - refresh: True

