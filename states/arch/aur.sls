{% macro aur(pkg) -%}
aur-{{ pkg }}:
  cmd.run:
    - name: pacaur -S --noconfirm --noedit {{ pkg }}
    - runas: {{ grains.user }}
{%- endmacro %}
