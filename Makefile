CRYSTAL ?= crystal
PREFIX  ?= /usr/local
BINDIR  ?= $(PREFIX)/bin

.PHONY: all
all: gshards-get-pkgname gshards-has-targets

install: all
	mkdir -p "$(DESTDIR)$(BINDIR)"
	install -m 0755 gshards-get-pkgname "$(DESTDIR)$(BINDIR)"
	install -m 0755 gshards-has-targets "$(DESTDIR)$(BINDIR)"

gshards-get-pkgname: gshards-get-pkgname.cr
	$(CRYSTAL) build $(CRFLAGS) $<

gshards-has-targets: gshards-has-targets.cr
	$(CRYSTAL) build $(CRFLAGS) $<
