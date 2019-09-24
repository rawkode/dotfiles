# Dotfiles

My personal dotfiles, coordinated by SaltStack

## Prequisites

- Install SaltStack

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
