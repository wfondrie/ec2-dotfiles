all: ~/.bashrc

~/%: %
	cp -rv $? $@
