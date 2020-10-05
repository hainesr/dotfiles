#
# General environment settings that have no other obvious home.
#
# Robert Haines.
#

# Default editor

# Set both of these to `vi` as there is rarely a need for a line editor these
# days. I'm not using `vim` here in case I haven't installed it yet when I need
# an editor! If `vim` is installed then calling `vi` runs `vim` anyway.
export EDITOR=vi
export VISUAL=vi

# GitHub CLI

# Turn on bash completion
if [ -x "$(command -v gh)" ]; then
  eval "$(gh completion -s bash)"
fi

# Python

# From https://docs.python-guide.org/dev/pip-virtualenv/#requiring-an-active-virtual-environment-for-pip
export PIP_REQUIRE_VIRTUALENV=true
