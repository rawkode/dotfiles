include:
  - .google-cloud-sdk

kubectl-from-gcloud:
  cmd.run:
    - name: gcloud components install kubectl
    - require:
      - sls: .google-cloud-sdk
