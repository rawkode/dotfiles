include:
  - .google-cloud-sdk

kubectl-from-gcloud:
  cmd.run:
    - name: gcloud components install kubectl --quiet
    - require:
      - sls: google-cloud-sdk
