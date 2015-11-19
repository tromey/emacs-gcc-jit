all: gcc-jit.el

GCC_WITH_PYTHON = gcc-with-python2
INC = /home/tromey/gcc/gcc/gcc/jit/

gcc-jit.el: bindings.c genbindings.py
	 $(GCC_WITH_PYTHON) genbindings.py -I$(INC) --syntax-only $< > $@
