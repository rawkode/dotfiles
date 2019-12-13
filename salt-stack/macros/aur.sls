{% macro aur(pkg) -%}
{{ pkg }}:
    pkg.installed

aur-{{ pkg }}:
  cmd.run:
    - name: yay -S --noconfirm {{ pkg }}
    - runas: {{ grains.user }}
    - onfail:
      - pkg: {{ pkg }}
{%- endmacro %}
