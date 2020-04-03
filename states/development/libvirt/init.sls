libvirt/remove-gnome-boxes:
  pkg.removed:
    - pkgs:
      - gnome-boxes
      - qemu

libvirt/packages:
  pkg.installed:
    - pkgs:
      - dnsmasq
      - ebtables
      - libvirt
      - qemu-headless

libvirt/services:
  service.running:
    - names:
      - libvirtd.service
      - virtlogd.service
    - enable: True

libvirt/network/start:
  cmd.run:
    - name: virsh net-start default
    - onlyif: virsh net-list --inactive | grep default

libvirt/network/autostart:
  cmd.run:
    - name: virsh net-autostart default

libvirt/network/user-access:
  group.present:
    - name: libvirt
    - system: True
    - addusers:
      - {{ grains.user }}
