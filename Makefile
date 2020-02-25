.PHONY: setup state dotfiles

dotfiles:
	@find ./dotfiles -type f -name "Makefile" -execdir make \;

nix-system:
	@cd ni; ./install-system.sh

nix-user:
	@cd nix; ./install-user.sh

.DEFAULT_GOAL := state
state?=grains

setup: grains
	@sudo salt-call --local --config-dir=. state.sls setup

state: grains
	@sudo salt-call --local --config-dir=. state.sls $(state)

grains:
	@echo "homedir: ${HOME}" > grains
	@echo "user: ${USER}" >> grains
