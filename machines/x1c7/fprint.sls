fprintd:
  pkg.installed

fprintd/{{ grains.user }}/group:
  user.present:
    - name: {{ grains.user }}
    - remove_groups: False
    - groups:
      - input

fprintd/system-local-login:
  file.line:
    - name: /etc/pam.d/system-local-login
    - mode: ensure
    - before: ^auth
    - content: auth sufficient pam_fprintd.so

fprintd/sudo:
  file.line:
    - name: /etc/pam.d/sudo
    - mode: ensure
    - before: ^auth
    - content: auth sufficient pam_fprintd.so
