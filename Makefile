CC ?= gcc
DESTDIR ?= /
LIBDIR ?= $(DESTDIR)$(prefix)/lib/$(multiarch_dir)

libhook-phosh-noime.so: hook-phosh-noime.c
	$(CC) -shared -fpic -ldl $(CFLAGS) -o libhook-phosh-noime.so hook-phosh-noime.c

all: libhook-phosh-noime.so

install: libhook-phosh-noime.so
	install -d $(DESTDIR)/etc/profile.d
	install -m 644 etc/profile.d/zz-hook-phosh-noime.sh $(DESTDIR)/etc/profile.d/
	install -d $(LIBDIR)
	install -m 644 libhook-phosh-noime.so $(LIBDIR)/

clean:
	rm -rf libhook-phosh-noime.so

.PHONY: all install clean
