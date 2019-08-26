# Dotfiles

My personal dotfiles, coordinated by SaltStack

## Prequisites

* Install SaltStack

## Configuration

If you're not me, you'll need to modify the user information in the grains file.

## Setup

`sudo salt-stack --local --config=. state.sls setup`

## Install

## Chromebook Linux VMs

This will install GUI applications, as Linux as limited support for these; but skips desktop experience.

`sudo salt-stack --local --config=. state.sls chromebook`

## Linux Machines

This assumes it's a physical bare metal machine and provisions the desktop experience too.

`sudo salt-stack --local --config=. state.sls linux`

## Cloud VMs

This will only install CLI development tooling.

`sudo salt-stack --local --config=. state.sls server`
