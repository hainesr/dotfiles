#
# Install everything into my home directory.
#
# Robert Haines.
#
# BSD Licenced. See LICENCE for details.
#

DOTDIR := dot
BINDIR := bin
DKRDIR := docker-bin
USRBIN := $(HOME)/bin

TMPDOT := templates/dot
TMPEXT := templates/extra

SRCS := $(wildcard $(DOTDIR)/*.sh)
DOTS := $(patsubst $(DOTDIR)/%.sh, $(DOTDIR)/.%, $(SRCS))

.PHONY: all bins clean docker-bins dots extra

all: bins docker-bins dots extra

dots: $(DOTS)
	@install -v -m600 $(DOTS) "$(HOME)"

bins:
	@install -v -m755 -d "$(USRBIN)"
	@install -v -m755 $(BINDIR)/* "$(USRBIN)"

docker-bins:
	@install -v -m755 -d "$(USRBIN)"
	@install -v -m755 $(DKRDIR)/* "$(USRBIN)"

extra: "$(HOME)/.extra"

"$(HOME)/.extra":
	@install -v -m600 $(TMPEXT) $@

clean:
	@rm -f $(DOTS)
	@echo REMOVE $(DOTS)

$(DOTDIR)/.%: $(DOTDIR)/%.sh
	@m4 -DSUB_DOT_PATH=$(PWD) -DSUB_DOT_NAME=$< < $(TMPDOT) > $@
	@echo CREATE $@
