all: ~/.bashrc

~/.bashrc: .bashrc
	cp $? $@ && source $@

~/%: %
	cp -rv $? $@
