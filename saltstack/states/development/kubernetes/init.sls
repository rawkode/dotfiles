include:
  - ../libvirt

kubernetes/packages:
  pkg.installed:
    - pkgs:
      - draft-bin
      - k9s
      - kubectl
      - kubernetes-helm-bin
      - minikube
      - skaffold
