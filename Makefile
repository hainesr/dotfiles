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

SRCS := $(wildcard $(DOTDIR)/*)
INTS := $(patsubst $(DOTDIR)/%.sh, $(DOTDIR)/.%, $(filter %.sh, $(SRCS)))
DOTS := $(patsubst $(DOTDIR)/%.sh, $(HOME)/.%, $(filter %.sh, $(SRCS)))
CONF := $(patsubst $(DOTDIR)/%, $(HOME)/.%, $(filter-out %.sh, $(SRCS)))

.PHONY: all bins clean docker-bins dots extra

all: bins docker-bins dots

dots: $(DOTS) $(CONF) extra

bins:
	@install -v -m755 -d "$(USRBIN)"
	@install -v -m755 $(BINDIR)/* "$(USRBIN)"

docker-bins:
	@install -v -m755 -d "$(USRBIN)"
	@install -v -m755 $(DKRDIR)/* "$(USRBIN)"

extra: $(HOME)/.extra

$(HOME)/.extra: $(TMPEXT)
	@echo -n 'INSTALL '
	@install -v -m600 $(TMPEXT) $@

$(HOME)/.%: $(DOTDIR)/%
	@echo -n 'LINK '
	@ln -sv $(PWD)/$< $@

$(HOME)/.%: $(DOTDIR)/.%
	@echo -n 'INSTALL '
	@install -v -m600 $< $(HOME)

clean:
	@echo CLEAN $(INTS)
	@rm -f $(INTS)

$(DOTDIR)/.%: $(DOTDIR)/%.sh
	@echo CREATE $@
	@m4 -DSUB_DOT_PATH=$(PWD) -DSUB_DOT_NAME=$< < $(TMPDOT) > $@
