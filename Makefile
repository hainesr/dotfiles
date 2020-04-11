#
# Install the dotfiles by linking them into my home directory.
#
# Robert Haines.
#
# BSD Licenced. See LICENCE for details.
#

DOTDIR := dot
bin-dir=$(HOME)/bin

SRCS := $(wildcard $(DOTDIR)/*.sh)
DOTS := $(patsubst $(DOTDIR)/%.sh, $(DOTDIR)/.%, $(SRCS))

.PHONY: all bins clean docker-bins dots

all: bins docker-bins dots

dots: $(DOTS)
	@install -v -m600 $(DOTS) "$(HOME)"

bins:
	install -v -m755 -d "$(bin-dir)"
	install -v -m755 bin/* "$(bin-dir)"

docker-bins:
	install -v -m755 -d "$(bin-dir)"
	install -v -m755 docker-bin/* "$(bin-dir)"

clean:
	@rm -f $(DOTS)
	@echo REMOVE $(DOTS)

$(DOTDIR)/.%: $(DOTDIR)/%.sh
	@m4 -DSUB_DOT_PATH=$(PWD) -DSUB_DOT_NAME=$< < templates/dot > $@
	@echo CREATE $@
