{% macro clone(domain, org, repo) -%}
{% set clone_url = "https://" ~ domain ~ "/" ~ org ~ "/" ~ repo %}

{{ domain }}/{{ org }}/{{ repo}}:
  git.cloned:
    - name: {{ clone_url }}
    - target: {{ grains.homedir }}/Code/src/{{ domain }}/{{ org }}/{{ repo }}
    - branch: master
    - user: {{ grains.user }}

{% if grains.user != org %}
{{ domain }}/{{ org }}/{{ repo}}/{{ grains.user }}:
  module.run:
    - name: git.remote_set
    - cwd: {{ grains.homedir }}/Code/src/{{ domain }}/{{ org }}/{{ repo }}
    - user: {{ grains.user }}
    - url: git@{{ domain }}}}:{{ grains.user }}/{{ repo }}
    - remote: {{ grains.user }}
{% endif %}

{%- endmacro %}

{{ clone('github.com', 'influxdata', 'flux') }}
{{ clone('github.com', 'influxdata', 'influxdb') }}
{{ clone('github.com', 'influxdata', 'telegraf') }}
{{ clone('github.com', 'rawkode', 'influxdb-examples') }}
{{ clone('github.com', 'rawkode', 'modern-life') }}
{{ clone('github.com', 'rawkode', 'saltstack-dotfiles') }}
