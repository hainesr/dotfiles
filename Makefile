#
# Install the dotfiles by linking them into my home directory.
#
# Robert Haines.
#
# BSD Licenced. See LICENCE for details.
#

PHONY: all bins dots

all: bins dots

dots:
	for file in $(shell git ls-files --exclude-standard -- .[a-z]*); do \
		full=$$(readlink -f $$file); \
		ln -sfn $$full $(HOME)/$$file; \
	done

bins:
	for file in $(shell git ls-files --exclude-standard -- bin/*); do \
		full=$$(readlink -f $$file); \
		name=$$(basename $$file); \
		cp -a $$full $(HOME)/bin/$$name; \
	done
