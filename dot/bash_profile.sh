# Pull in global profile for `sh`.
. /etc/profile

# Pull in .bashrc.
if [[ -f $HOME/.bashrc ]]; then
	. $HOME/.bashrc
fi
