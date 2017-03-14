base:
  '*':
    # We run Docker before 'setup', because we need the 'docker' group to exist
    # before we configure our user account with the group :)
    - docker
    - setup
    - cli
