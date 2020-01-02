# Dotfiles

My personal dotfiles, coordinated by Nix, Make, and SaltStack.

## Prequisites

- Install Nix
- Install SaltStack

## Provisioning

### Dotfiles

I keep my dotfiles out of Nix and SaltStack, so that they can be used regardless of provisioning method.

I may go back to this being entirely in Nix, but until I feel Nix Packages can compete with the AUR; I'll keep them separate.

### Nix

```shell
# NixOS Only
# Installs/Updates a NixOS machine
make nix-system

# Any OS
# Installs/Maintains User Packages
make nix-user
```

### SaltStack

## Setup

`make setup`

## Install

## Chromebook Linux VMs

This will install GUI applications, as Linux as limited support for these; but skips desktop experience.

`make state=chromebook`

## Linux Machines

This assumes it's a physical bare metal machine and provisions the desktop experience too.

`make state=linux`

## Cloud VMs

This will only install CLI development tooling.

`make state=server`

## Running a Single State

`make state=apps.alacritty`
