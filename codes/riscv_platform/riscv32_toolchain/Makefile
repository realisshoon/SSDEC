DIRS	= $(subst /,, $(dir $(wildcard */Makefile)))

all:

build:
	/bin/sh ./BuildRV32.sh

clean cleanup clobber:
	for D in $(DIRS); do\
		if [ -f $$D/Makefile ] ; then \
			echo "make -C $$D -s $@";\
			make -C $$D -s $@;\
		fi;\
	done

cleanupall distclean:
	/bin/rm -rf riscv-gnu-toolchain
	/bin/rm -rf riscv-pk
	/bin/rm -rf riscv-isa-sim
	for D in $(DIRS); do\
		if [ -f $$D/Makefile ] ; then \
			echo "make -C $$D -s $@";\
			make -C $$D -s $@;\
		fi;\
	done

.PHONY: all clean cleanup clobber cleanupall
