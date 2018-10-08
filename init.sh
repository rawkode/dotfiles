#!/usr/bin/env bash
HOMEDIR=$HOME
USERNAME=$(whoami)

USE_SUDO=''
if [ $USERNAME != "root" ];
then
  USE_SUDO="sudo "
fi

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
		wget -qO- https://bootstrap.saltstack.com | $USE_SUDO sh -s -- -P -d git v2018.11
	fi
fi

# Set the user, home-directory, and state root
$USE_SUDO salt-call --local --config=./ --state-output=changes grains.setvals "{ \"user\": \"$USERNAME\", \"homedir\": \"$HOMEDIR\" }"

# Apply the high state
if [[ ! $1 ]];
then
	$USE_SUDO salt-call --local --config=./ --state-output=mixed --retcode-passthrough state.highstate
else
	$USE_SUDO salt-call --local --config=./ --state-output=mixed --retcode-passthrough state.sls $1
fi
