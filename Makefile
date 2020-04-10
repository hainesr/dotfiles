#
# Install the dotfiles by linking them into my home directory.
#
# Robert Haines.
#
# BSD Licenced. See LICENCE for details.
#

bin-dir=$(HOME)/bin

PHONY: all bins docker-bins dots

all: bins docker-bins dots

dots:
	for file in $(shell git ls-files --exclude-standard -- dot/*); do \
		full=$$(readlink -f $$file); \
		name=$$(basename $$file); \
		ln -sfn $$full $(HOME)/.$$name; \
	done

bins:
	install -v -m755 -d "$(bin-dir)"
	install -v -m755 bin/* "$(bin-dir)"

docker-bins:
	install -v -m755 -d "$(bin-dir)"
	install -v -m755 docker-bin/* "$(bin-dir)"
