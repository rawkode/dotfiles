SALTSTACK_DIR := .
.DEFAULT_GOAL := state
state?=grains

state: grains
	@sudo salt-call --local --config-dir=$(SALTSTACK_DIR) state.sls $(state)

grains:
	@echo "homedir: ${HOME}" > $(SALTSTACK_DIR)/grains
	@echo "user: ${USER}" >> $(SALTSTACK_DIR)/grains
