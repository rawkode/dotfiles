#!/bin/bash
##

# Are we on OSX and do we need homebrew?
if [[ `uname` == 'Darwin' ]];
then
	command -v brew > /dev/null 2>&1
	if [ $? -ne 0 ];
	then
		echo "Homebrew not found. Installing ..."
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi

	# Do we need to install SaltStack?
	command -v salt-call > /dev/null 2>&1
	if [ $? -ne 0 ];
	then
		echo "SaltStack not found. Installing ..."
		brew install saltstack
	fi
else
	# Do we need to install SaltStack?
	command -v salt-call > /dev/null 2>&1
	if [ $? -ne 0 ];
	then
		# Linux (Hopefully ...): SaltStack Bootstrap one-liner
		wget -qO- https://bootstrap.saltstack.com | sudo sh -s -- -P git develop
	fi
fi

DIR=$(pwd)
HOMEDIR=$HOME
USERNAME=$(whoami)

# Set the user, home-directory, and state root
sudo salt-call --local --file-root=$DIR/states/ --state-output=changes grains.setval user "$USERNAME"
sudo salt-call --local --file-root=$DIR/states/ --state-output=changes grains.setval homedir "$HOMEDIR"
sudo salt-call --local --file-root=$DIR/states/ --state-output=changes grains.setval stateroot "$DIR/states"

# Apply the high state
if [[ ! $1 ]];
then
	sudo salt-call --local --file-root=$DIR/states/ --state-output=changes  --log-level=quiet state.highstate
else
	sudo salt-call --local --file-root=$DIR/states/ --state-output=changes  --log-level=quiet state.sls $1
fi
