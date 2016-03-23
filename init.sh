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
		curl -L https://bootstrap.saltstack.com | sudo sh -s -- -P git develop
	fi
fi

DIR=$(pwd)
HOMEDIR=$HOME
USERNAME=$(whoami)

# Set the user, home-directory, and state root
sudo salt-call --local --file-root=$DIR/states/ --output=highstate --state-output=changes --log-level=quiet grains.setval user $USERNAME
sudo salt-call --local --file-root=$DIR/states/ --output=highstate --state-output=changes --log-level=quiet grains.setval homedir $HOMEDIR
sudo salt-call --local --file-root=$DIR/states/ --output=highstate --state-output=changes --log-level=quiet grains.setval stateroot $DIR/states

# Apply the high state
sudo salt-call --local --file-root=$DIR/states/ --output=highstate --state-output=changes  --log-level=quiet state.highstate
