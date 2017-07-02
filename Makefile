#
# Install the dotfiles by linking them into my home directory.
#
# Robert Haines.
#
# BSD Licenced. See LICENCE for details.
#

bin-dir=$(HOME)/bin
docker-execs={jekyll,mencoder,p4merge,xnview}

PHONY: all bins docker-bins dots

all: bins docker-bins dots

dots:
	for file in $(shell git ls-files --exclude-standard -- dot/*); do \
		full=$$(readlink -f $$file); \
		name=$$(basename $$file); \
		ln -sfn $$full $(HOME)/.$$name; \
	done

$(bin-dir):
	mkdir $(bin-dir)

bins: | $(bin-dir)
	for file in $(shell git ls-files --exclude-standard -- bin/*); do \
		full=$$(readlink -f $$file); \
		name=$$(basename $$file); \
		cp -a $$full $(HOME)/bin/$$name; \
	done

docker-bins: | $(bin-dir)
	for prog in $(docker-execs); do \
		sed "s/##program_name##/$$prog/" src/bin_template > $(bin-dir)/$$prog; \
		chmod 755 $(bin-dir)/$$prog; \
	done
