export ANDROID_HOME=/opt/android-sdk
export COMPOSER_HOME=$HOME/.composer
export GOPATH=$HOME/Code

# In zsh, the $PATH variable is tied to the $path variable.
# This makes the $path variable act like a set.
typeset -U path

path=("$ANDROID_HOME/tools/bin")
path=("$ANDROID_HOME/tools")
path=("$ANDROID_HOME/platform-tools")
path=("$COMPOSER_HOME/vendor/bin")
path=("$GOPATH/bin" $path)
path=("$HOME/.cargo/bin" $path)
path=("/opt/flutter/bin")

# Using the (N-/) glob qualifier we can remove paths that do not exist.
path=($^path(N-/))
