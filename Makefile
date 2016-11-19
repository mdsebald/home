PROJDIR = $(realpath $(CURDIR))

all: vimdir vimrc gvimrc bash kerlrc tmux git

vimdir: $(HOME)/.vim/colors/solarized.vim $(HOME)/.vim/scripts/set_utf8.vim
$(HOME)/.vim/colors/solarized.vim:
	curl -Lo dot-vim/colors/solarized.vim https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim
	ln -vsf $(PROJDIR)/dot-vim $(HOME)/.vim

$(HOME)/.vim/scripts/set_utf8.vim:
	curl -Lo dot-vim/scripts/set_utf8.vim https://raw.githubusercontent.com/vim-scripts/set_utf8.vim/master/plugin/set_utf8.vim
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