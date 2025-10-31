DIRS	= $(subst /,, $(dir $(wildcard */Makefile)))

all:

clean cleanup clobber cleanupall:
	for D in $(DIRS); do\
		if [ -f $$D/Makefile ] ; then \
			echo "make -C $$D -s $@";\
			make -C $$D -s $@;\
		fi;\
	done
	make -C booksim/booksim2/src distclean
	make -C noxim/noxim/bin clean

.PHONY: all clean cleanup clobber cleanupall
