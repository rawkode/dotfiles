include:
  - {{ grains.os_family | lower }}: emacs

emacs-init.el:
  file.managed:
    - name: {{ grains.homedir }}/.emacs.d/init.el
    - makedirs: True
    - source: salt://emacs/init.el
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - force: True

emacs-custom.el:
  file.managed:
    - name: {{ grains.homedir }}/.emacs.d/custom.el
    - source: salt://emacs/custom.el
    - user: {{ grains.user }}
    - group: {{ grains.user }}
    - force: True

