#Makefile to manage dotfiles
# Doug Chapman <prjctgeek@gmail.com>
#-*- coding: utf-8 -*-

homedir:= $(shell echo ${HOME})
PWD:= $(shell echo ${PWD})

all: $(homedir)/.bash_profile $(homedir)/.tmux.conf $(homedir)/.bash_functions 

#bash
$(homedir)/.bash_profile:
	cp $(PWD)/bash_profile $(homedir)/.bash_profile

$(homedir)/.bash_local:
	mkdir $(homedir)/.bash_local
	mv $(homedir)/.bashrc $(homedir)/.bash_local/bashrc

$(homedir)/.bashrc: $(homedir)/.bash_profile $(homedir)/.bash_local
	cp ./bashrc $(homedir)/.bashrc

$(homedir)/.bash_functions: $(homedir)/.bashrc
	ln -s $(PWD)/bash_functions $(homedir)/.bash_functions

#tmux
$(homedir)/.tmux.conf:
	cp ./tmux/tmux.conf $(homedir)/.tmux.conf

#try to put things back
# but the .bash_local will need to stay, since we don't know it's state.
clean:
	rm $(homedir)/.tmux.conf \
		$(homedir)/.bash_functions \
		$(homedir)/.bashrc
	cp ./local_only_bashrc $(homedir)/.bashrc

