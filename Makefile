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

BINS := $(patsubst $(BINDIR)/%, $(USRBIN)/%, $(wildcard $(BINDIR)/*))
DBIN := $(patsubst $(DKRDIR)/%, $(USRBIN)/%, $(wildcard $(DKRDIR)/*))

.PHONY: all bins clean docker-bins dots extra

all: bins docker-bins dots

bins: $(BINS)

clean:
	@echo CLEAN $(INTS)
	@rm -f $(INTS)

docker-bins: $(DBIN)

dots: $(DOTS) $(CONF) extra

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

$(DOTDIR)/.%: $(DOTDIR)/%.sh
	@echo CREATE $@
	@m4 -DSUB_DOT_PATH=$(PWD) -DSUB_DOT_NAME=$< < $(TMPDOT) > $@

$(USRBIN)/%: $(BINDIR)/% | $(USRBIN)
	@echo -n 'INSTALL '
	@install -v -m755 $< $@

$(USRBIN)/%: $(DKRDIR)/% | $(USRBIN)
	@echo -n 'INSTALL '
	@install -v -m755 $< $@

$(USRBIN):
	@echo -n 'INSTALL '
	@install -v -m755 -d "$(USRBIN)"
