all: .bashrc

~/%: %
	cp -rv $@ ~/$@
