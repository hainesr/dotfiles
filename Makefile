#
# Install the dotfiles by linking them into my home directory.
#
# Robert Haines.
#
# BSD Licenced. See LICENCE for details.
#

PHONY: all dots

all: dots

dots:
	for file in $(shell git ls-files --exclude-standard -- .[a-z]*); do \
		full=$$(readlink -f $$file); \
		ln -sfn $$full $(HOME)/$$file; \
	done
