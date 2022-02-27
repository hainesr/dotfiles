#
# Application specific path configuration should go here.
#

# Go.

GOPATH="$HOME/work/projects/go"

export GOPATH

# npm.

NODE_PATH="$HOME/.node/lib/node_modules:$NODE_PATH"

export NODE_PATH

# Homebrew (MacOS).

if [[ -d /opt/homebrew/opt/coreutils/libexec/gnubin ]]; then
  # Proper coreutils for the Mac.
  PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
fi

if [[ -d /opt/homebrew/opt/gnupg@2.2/bin ]]; then
  PATH="/opt/homebrew/opt/gnupg@2.2/bin:$PATH"
fi

#
# Manage the main PATH variable here.
#

# The user's private bin should be the last of the prepended paths.
prepend=(/opt/software/eclipse "$GOPATH/bin" /usr/local/go/bin "$HOME/.node/bin" "$HOME/bin")

# The user's local config bin should be the last of the appended paths.
append=("$HOME/.local/bin")

# Add paths to the front of PATH, if they exist.
for path in ${prepend[@]}; do
  if [ -d "$path" ] ; then
    PATH="$path:$PATH"
  fi
done

# Add paths to the end of PATH, if they exist.
for path in ${append[@]}; do
  if [ -d "$path" ] ; then
    PATH="$PATH:$path"
  fi
done

unset path prepend append

export PATH
