plymouth:
  aur.installed:
    - names:
      - plymouth
      - plymouth-theme-arch-logo

plymouth/mkinitcpio/hooks:
  file.line:
    - name: /etc/mkinitcpio.conf
    - mode: replace
    - match: ^HOOKS
    - content: HOOKS=(base udev resume systemd sd-plymouth btrfs keyboard autodetect modconf block sd-vconsole consolefont sd-encrypt fsck filesystems)

plymouth/mkinitcpio/modules:
  file.line:
    - name: /etc/mkinitcpio.conf
    - mode: replace
    - match: ^MODULES
    - content: MODULES=(i915)

plymouth/mkinitcpio/linux:
  cmd.run:
    - name: mkinitcpio -p linux
    - onchanges:
      - file: plymouth/mkinitcpio/hooks
      - file: plymouth/mkinitcpio/modules
    - onlyif:
      - ls /boot/vmlinuz-linux

plymouth/mkinitcpio/linux-zen:
  cmd.run:
    - name: mkinitcpio -p linux-zen
    - onchanges:
      - file: plymouth/mkinitcpio/hooks
      - file: plymouth/mkinitcpio/modules
    - onlyif:
      - ls /boot/vmlinuz-linux-zen

plymouth/config:
  file.managed:
    - name: /etc/plymouth/plymouthd.conf
    - source: salt://{{ slspath }}/files/plymouthd.conf

plymouth/systemd-boot:
  cmd.run:
    - name: perl -pi -e 's/^options\s+(?!quiet)/options quiet splash loglevel=3 rd.udev.log_priority=3 vt.global_cursor_default=0 /g' /boot/loader/entries/*.conf

plymouth/gdm/disable:
  service.disabled:
    - name: gdm
    - reload: True

plymouth/gdm/enable:
  service.enabled:
    - name: gdm-plymouth
    - enable: True
    - reload: True
