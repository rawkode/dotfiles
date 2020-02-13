{ config, pkgs, ... }:

{
  imports =
    [
      ./containers.nix
      ./git.nix
      ./python.nix
      ./vscode.nix
    ];

  nixpkgs.config = {
    android_sdk = {
      accept_license = true;
    };
  };

  home.packages = (with pkgs; [
    # CircleCI
    circleci-cli

    # Crystal
    crystal
    shards

    # Cue
    cue

    # Dart
    #dart

    # Flutter
    # flutter

    # Go
    go

    # Google Cloud
    google-cloud-sdk

    # JavaScript
    nodejs
    yarn

    # Pony
    ponyc
    pony-stable

    # Pulumi
    #pulumi-bin

    # Python
    pipenv
    python
    pythonPackages.virtualenv

    # Runfiles
    #run

    # Scala
    scala
    scalafix
    scalafmt

    # Terraform
    terraform_0_12
  ]);
}
