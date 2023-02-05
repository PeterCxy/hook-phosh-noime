CC ?= gcc
DESTDIR ?= /
LIBDIR ?= $(DESTDIR)$(PREFIX)usr/lib

libhook-phosh-noime.so: hook-phosh-noime.c
	$(CC) -shared -fpic -ldl $(CFLAGS) -o libhook-phosh-noime.so hook-phosh-noime.c

all: libhook-phosh-noime.so

install: libhook-phosh-noime.so
	install -d $(DESTDIR)$(PREFIX)/etc/profile.d
	install -m 644 etc/profile.d/zz-hook-phosh-noime.sh $(DESTDIR)$(PREFIX)/etc/profile.d/
	install -d $(LIBDIR)
	install -m 644 libhook-phosh-noime.so $(LIBDIR)/

.PHONY: all install
