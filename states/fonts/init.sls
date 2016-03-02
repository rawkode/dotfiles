{% if grains.os_family == 'Debian' %}
fonts-hack-clone:
    git.latest:
        - name: https://github.com/chrissimpkins/Hack.git
        - target: /opt/fonts-hack
        - depth: 1

fonts-hack-copy-files:
    cmd.run:
        - name: cp -R /opt/fonts-hack/build/ttf /usr/share/fonts/truetype/hack

fonts-hack-install:
    cmd.run:
        - name: fc-cache -s; mkfontscale /usr/share/fonts/truetype/hack; mkfontdir /usr/share/fonts/truetype/hack
{% else %}
{% endif %}

