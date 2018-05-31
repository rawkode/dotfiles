{% macro aur(pkg) -%}
aur-{{ pkg }}:
  cmd.run:
    - name: yay -S --noconfirm {{ pkg }}
    - runas: {{ grains.user }}
{%- endmacro %}
