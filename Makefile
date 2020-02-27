.PHONY: arch dotfiles

dotfiles:
	@find ./dotfiles -type f -name "Makefile" -execdir make \;

arch:
	@unipkg unipkg.yaml arch | zsh

nix-system:
	@cd ni; ./install-system.sh

nix-user:
	@cd nix; ./install-user.sh
