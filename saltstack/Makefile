.DEFAULT_GOAL := state
state?=grains

setup: grains
	@sudo salt-call --local --config-dir=. state.sls setup

state: grains
	@sudo salt-call --local --config-dir=. state.sls $(state)

grains:
	@echo "homedir: ${HOME}" > grains
	@echo "user: ${USER}" >> grains
