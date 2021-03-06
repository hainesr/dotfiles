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
alias ll='ls -lh --color'
alias la='ls -A --color'
alias ls='ls -F --color'

# Human readable numbers for df and du.
alias df='df -h'
alias du='du -h'
alias du1='du --max-depth=1' # Just give me the high-level info.

# Safer rm.
alias rm='rm -i'

# A forceful rm.
alias rmf='rm -f'

# Don't go nuts, ping.
alias ping='ping -c 4'

# Make ssh a bit more secure and do the Agent and X forwarding thing.
alias ssh='ssh -2 -A -Y'

# Always colour grep.
alias grep='grep -n --color=auto'

# I like the old ways.
alias dos2unix='fromdos'
alias unix2dos='todos'

# I only ever use gitk --all.
alias gitk='gitk --all'

# Allow aliases to be sudoed.
# See: https://github.com/jfrazelle/dotfiles/blob/master/.aliases#L45
alias sudo='sudo '

# Rerun the previous command with sudo.
# See: https://twitter.com/zzaaho/status/1160825118597292032
alias please='sudo $(fc -ln -1)'

# Add an "alert" alias for long running commands. Use like so:
# $ sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
