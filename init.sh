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
		echo "We need SaltStack ..."
		# Linux (Hopefully ...): SaltStack Bootstrap one-liner
		# -d Don't enable salt-minion autostart
		# -P Allow pip based installations
		wget -qO- https://bootstrap.saltstack.com | sudo sh -s -- -P -d git develop
	fi
fi

HOMEDIR=$HOME
USERNAME=$(whoami)

# Set the user, home-directory, and state root
sudo salt-call --local --config=./ --state-output=changes grains.setvals "{ \"user\": \"$USERNAME\", \"homedir\": \"$HOMEDIR\" }"

# Apply the high state
if [[ ! $1 ]];
then
	sudo salt-call --local --config=./ --state-output=changes  --log-level=quiet state.highstate
else
	sudo salt-call --local --config=./ --state-output=changes  --log-level=quiet state.sls $1
fi
