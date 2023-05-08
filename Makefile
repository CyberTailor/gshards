CRYSTAL ?= crystal
PREFIX  ?= /usr/local
BINDIR  ?= $(PREFIX)/bin

.PHONY: all
all: gshards-get-pkgname gshards-print-targets

install: all
	mkdir -p "$(DESTDIR)$(BINDIR)"
	install -m 0755 gshards-get-pkgname "$(DESTDIR)$(BINDIR)"
	install -m 0755 gshards-print-targets "$(DESTDIR)$(BINDIR)"

gshards-get-pkgname: gshards-get-pkgname.cr
	$(CRYSTAL) build $(CRFLAGS) $<

gshards-print-targets: gshards-print-targets.cr
	$(CRYSTAL) build $(CRFLAGS) $<
