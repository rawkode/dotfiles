fonts/emoji/install:
  aur.install:
    - name: noto-fonts-emoji

# Raise priority of Noto Color Emoji
fonts/emoji/config:
  file.managed:
    - name: {{ grains.homedir }}/.config/fontconfig/fonts.conf
    - source: salt://{{ slspath }}/files/fontconfig.xml
    - user: {{ grains.user }}
    - makedirs: True
