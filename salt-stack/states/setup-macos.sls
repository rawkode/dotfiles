#
# Assuming I installed SaltStack through brew anyway!
#
# brew-install:
#   cmd.run:
#     - name: /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#     - unless:
#       - ls /usr/local/bin/brew

brew-brewfile:
  file.managed:
    - name: {{ grains['homedir'] }}/.config/brew/Brewfile
    - source: salt://macOS/Brewfile
    - user: {{ grains['user'] }}
    - makedirs: True

macOS-brew:
  cmd.run:
    - name: brew bundle install --file={{ grains['homedir'] }}/.config/brew/Brewfile
    - runas: {{ grains.user }}
