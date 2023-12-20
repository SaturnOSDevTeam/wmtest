SRC = saturnwm.c
OBJ = $(SRC:.c=.o)

PREFIX = /usr/local

all: saturnwm

.c.o:
	$(CC) -I/usr/X11R6/include -c  $<

saturnwm: $(OBJ)
	$(CC) -o $@ $(OBJ) -O3 -I/usr/X11R6/include -L/usr/X11R6/lib -lxcb -lxcb-keysyms -lxcb-ewmh -lxcb-icccm

install: saturnwm
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f saturnwm $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/saturnwm

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/saturnwm $(OBJ)

clean:
	rm -f saturnwm $(OBJ)
