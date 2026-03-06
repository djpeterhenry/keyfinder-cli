PREFIX=/usr/local

CPPFLAGS="-I/opt/homebrew/include"
LDFLAGS="-Wl,-L/opt/homebrew/lib,-rpath,/usr/local/lib/"

keyfinder-cli: keyfinder_cli.cpp key_notations.h
	# $(CXX) $< -std=c++11 -Wall -lkeyfinder -lavcodec -lavformat -lavutil -lswresample -lfftw3 -o $@
	$(CXX) $(CPPFLAGS) $(LDFLAGS) $< -std=c++11 -Wall -lkeyfinder -lavcodec -lavformat -lavutil -lswresample -lfftw3 -o $@

install: keyfinder-cli keyfinder-cli.1
	install -d "${DESTDIR}${PREFIX}/bin"
	install -m 755 keyfinder-cli "${DESTDIR}${PREFIX}/bin/keyfinder-cli"
	install -d "${DESTDIR}${PREFIX}/share/man/man1"
	install -m 644 keyfinder-cli.1 "${DESTDIR}${PREFIX}/share/man/man1/keyfinder-cli.1"

clean:
	rm keyfinder-cli
