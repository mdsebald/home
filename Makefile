PROJDIR = $(realpath $(CURDIR))

all: vimdir vimrc gvimrc bash kerlrc tmux git xorg gemrc

clean:
	@rm -vf $(PROJDIR)/dot-vim/colors/solarized.vim
	@rm -vf $(PROJDIR)/dot-vim/set_utf8.vim
	@rm -vrf $(HOME)/.vim
	@rm -vf $(HOME)/.vimrc
	@rm -vf $(HOME)/.gvimrc
	@rm -vf $(HOME)/.bashrc
	@rm -vf $(HOME)/.bash_aliases
	@rm -vf $(HOME)/.bash_profile
	@rm -vf $(HOME)/.kerlrc
	@rm -vf $(HOME)/.tmux.conf
	@rm -vf $(HOME)/.gitconfig
	@rm -vf $(HOME)/.gitignore_global
	@rm -vf $(HOME)/.gemrc
	@rm -vf $(HOME)/.xinitrc
	@rm -vf $(HOME)/.Xresources
	@rm -vf $(HOME)/.abcde.conf

vimdir: $(PROJDIR)/dot-vim/colors/solarized.vim $(PROJDIR)/dot-vim/set_utf8.vim $(HOME)/.vim
$(PROJDIR)/dot-vim/colors/solarized.vim:
	curl -Lo $(PROJDIR)/dot-vim/colors/solarized.vim \
		https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim

$(PROJDIR)/dot-vim/set_utf8.vim:
	curl -Lo $(PROJDIR)/dot-vim/set_utf8.vim \
		https://raw.githubusercontent.com/vim-scripts/set_utf8.vim/master/plugin/set_utf8.vim

$(HOME)/.vim:
	ln -vsf $(PROJDIR)/dot-vim $(HOME)/.vim

vimrc: $(HOME)/.vimrc
$(HOME)/.vimrc:
	ln -vsf $(PROJDIR)/dot-vimrc $(HOME)/.vimrc

gvimrc: $(HOME)/.gvimrc
$(HOME)/.gvimrc:
	ln -vsf $(PROJDIR)/dot-gvimrc $(HOME)/.gvimrc

bash: $(HOME)/.bashrc $(HOME)/.bash_aliases $(HOME)/.bash_profile
$(HOME)/.bashrc:
	ln -vsf $(PROJDIR)/dot-bashrc $(HOME)/.bashrc
$(HOME)/.bash_aliases:
	ln -vsf $(PROJDIR)/dot-bash_aliases $(HOME)/.bash_aliases
$(HOME)/.bash_profile:
	ln -vsf $(PROJDIR)/dot-bash_profile $(HOME)/.bash_profile

kerlrc: $(HOME)/.kerlrc
$(HOME)/.kerlrc:
	ln -vsf $(PROJDIR)/dot-kerlrc $(HOME)/.kerlrc

tmux: $(HOME)/.tmux.conf
$(HOME)/.tmux.conf:
	ln -vsf $(PROJDIR)/dot-tmux.conf $(HOME)/.tmux.conf

git: $(HOME)/.gitconfig $(HOME)/.gitignore_global
$(HOME)/.gitconfig:
	ln -vsf $(PROJDIR)/dot-gitconfig $(HOME)/.gitconfig
$(HOME)/.gitignore_global:
	ln -vsf $(PROJDIR)/dot-gitignore_global $(HOME)/.gitignore_global

gemrc: $(HOME)/.gemrc
$(HOME)/.gemrc:
	ln -vsf $(PROJDIR)/dot-gemrc $(HOME)/.gemrc

xorg: $(HOME)/.xinitrc $(HOME)/.Xresources
$(HOME)/.Xresources:
	ln -vsf $(PROJDIR)/dot-Xresources $(HOME)/.Xresources
	xrdb -merge $(HOME)/.Xresources
$(HOME)/.xinitrc:
	ln -vsf $(PROJDIR)/dot-xinitrc $(HOME)/.xinitrc

abcde: $(HOME)/.abcde.conf
$(HOME)/.abcde.conf:
	ln -vsf $(PROJDIR)/dot-abcde.conf $(HOME)/.abcde.conf
