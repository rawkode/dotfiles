{% macro snap(pkg, options) -%}
snap-{{ pkg }}:
  cmd.run:
    - name: snap install {{ options }} {{ pkg }}
{%- endmacro %}
