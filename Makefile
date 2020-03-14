.PHONY: arch dotfiles

dotfiles:
	@find ./dotfiles -type f -name "Makefile" -execdir make \;

arch:
	@unipkg unipkg.yaml arch | zsh

nix-system:
	@cd ni; ./install-system.sh

nix-user:
	@cd nix; ./install-user.sh

ansible-playbook:
	@ansible-playbook -i ./ansible/hosts ./ansible/playbooks/$(PLAYBOOK).yaml

ansible-role:
	@ansible -i ansible/hosts localhost --playbook-dir ./ansible -m include_role -a name=$(ROLE)
