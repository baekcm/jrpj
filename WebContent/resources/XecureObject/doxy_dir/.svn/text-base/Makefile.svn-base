all: js2doxyfile doxygen

js2doxyfile:
	./js2doxy.pl ../xecureweb.js | sed -e 's/void/var/g' | sed -e 's/int /var /g' > xecureweb.js
	./js2doxy.pl ../xecureweb_file.js | sed -e 's/void/var/g' | sed -e 's/int /var /g' > xecureweb_file.js


doxygen:
	doxygen Doxyfile

