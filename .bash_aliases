#!/bin/bash
#
# Bash aliases.
#
# Robert Haines.
#
# BSD Licenced. See LICENCE for details.
#

# Some cd aliases for easier navigation.
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

# Always use colour for ls and friends.
alias ll='ls -lhF --color'
alias la='ls -AF --color'
alias ls='ls --color'

# Human readable numbers for df and du.
alias df='df -h'
alias du='du -h'
alias du1='du --max-depth=1' # Just give me the high-level info.

# Safer rm.
alias rm='rm -i'

# Don't go nuts ping.
alias ping='ping -c 4'

# Make ssh a bit more secure and do the X forwarding thing.
alias ssh='ssh -2 -Y'

# Always colour grep.
alias grep='grep -n --color=auto'

# I like the old ways.
alias dos2unix='fromdos'
alias unix2dos='todos'

# I like docker to need sudo (for now) but don't like typing sudo.
alias docker='sudo docker'

# Allow aliases to be sudoed.
# See: https://github.com/jfrazelle/dotfiles/blob/master/.aliases#L45
alias sudo='sudo '

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
