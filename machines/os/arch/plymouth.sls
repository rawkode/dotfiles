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
    - content: HOOKS=(base udev resume systemd btrfs sd-plymouth keyboard autodetect modconf block sd-vconsole consolefont sd-encrypt fsck filesystems)

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

plymouth/systemd-boot:
  cmd.run:
    - name: perl -pi -e 's/^options\s+(?!quiet)/options quiet splash /g' /boot/loader/entries/*.conf
