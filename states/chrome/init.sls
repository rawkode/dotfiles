{% if grains.os_family == 'Debian' %}
chrome-install:
    pkg.installed:
        - name: {% if grains.os == "Debian" %}chromium{% else %}chromium-browser{% endif %}
{% else %}
    {# OSX will come later #}
{% endif %}

