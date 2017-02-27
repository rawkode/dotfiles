include:
  - {{ grains.os_family | lower }}: fonts

fonts-nerd-fonts:
    git.latest:
        - name: https://github.com/ryanoasis/nerd-fonts.git
        - target: /opt/fonts-nerd-fonts
        - depth: 1

foints-nerd-fonts-install:
   cmd.run:
       - name: ./install.sh Hack
       - cwd: /opt/fonts-nerd-fonts
       - runas: {{ grains.user }}
       - require:
           - git: fonts-nerd-fonts
