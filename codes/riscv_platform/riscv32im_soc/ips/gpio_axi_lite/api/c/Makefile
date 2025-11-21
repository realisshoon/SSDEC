
all:

doc:
	doxygen Doxyfile
	@if [ -f doxygen_out/latex/Makefile ]; then\
		make -C doxygen_out/latex;\
	fi
	@if [ -f doxygen_out/latex/refman.pdf ]; then\
		cp doxygen_out/latex/refman.pdf gpio_api.pdf;\
	fi

clean:

cleanup clobber: clean
	/bin/rm -fr doxygen_out

cleanupall distclean: cleanup
	/bin/rm -f gpio_api.pdf

