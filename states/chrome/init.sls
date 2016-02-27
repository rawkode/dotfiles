{% if grains.os == 'Ubuntu' %}
chrome-install:
    pkg.installed:
        - name: chromium-browser
{% else %}
    {# OSX will come later #}
{% endif %}

