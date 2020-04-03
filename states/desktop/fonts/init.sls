fonts/install:
  pkg.installed:
    - pkgs:
      - noto-fonts
      - noto-fonts-emoji
      - ttf-cascadia-code

# Raise priority of Noto Color Emoji
fonts/emoji/config:
  file.managed:
    - name: {{ grains.homedir }}/.config/fontconfig/fonts.conf
    - source: salt://{{ slspath }}/files/fontconfig.xml
    - user: {{ grains.user }}
    - makedirs: True
