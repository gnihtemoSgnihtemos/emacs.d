CURDIR ?= $(.CURDIR)

LN_FLAGS = -sfn

all: install

install:
	ln $(LN_FLAGS) $(CURDIR) ~/.emacs.d
