include:
    - ./{{ grains.os_family | lower }}

remove-gnome-boxes:
  pkg.removed:
    - pkgs:
      - gnome-boxes
      - qemnu

kubernetes-packages:
  pkg.installed:
    - pkgs:
      - dnsmasq
      - ebtables
      - kubectl
      - libvirt
      - minikube
      - qemu-headless

virtualisation/services:
  service.running:
    - names:
      - libvirtd.service
      - virtlogd.service
    - enable: True

virtualisation/network/start:
  cmd.run:
    - name: virsh net-start default
    - onlyif: virsh net-list --inactive | grep default

virtualisation/network/autostart:
  cmd.run:
    - name: virsh net-autostart default

virtualisation/network/user-access:
  group.present:
    - name: libvirt
    - system: True
    - addusers:
      - {{ grains.user }}
