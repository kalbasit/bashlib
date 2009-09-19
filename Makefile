VERSION=1

prefix=/usr/local
bindir=$(prefix)/bin
libdir=$(prefix)/lib
bashlibdir=$(libdir)/bash
INSTALL=install
MAKE=make

all: targets;

targets:
	sed -e "s:\(VERSION=\).*:\1$(VERSION):g" environment/Makefile.in > environment/Makefile
	sed -e "s:\(VERSION=\).*:\1$(VERSION):g" functions/Makefile.in > functions/Makefile
	$(MAKE) -C environment targets
	$(MAKE) -C functions targets

install:
	$(INSTALL) -d -m 755 $(DESTDIR)$(bashlibdir)
	$(MAKE) -C environment install
	$(MAKE) -C functions install

clean:
	sed -e "s:\(VERSION=\).*:\1$(VERSION):g" environment/Makefile.in > environment/Makefile
	sed -e "s:\(VERSION=\).*:\1$(VERSION):g" functions/Makefile.in > functions/Makefile
	$(MAKE) -C environment clean
	$(MAKE) -C functions clean
	rm -f environment/Makefile
	rm -f functions/Makefile
