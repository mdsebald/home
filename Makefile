PROJDIR := $(realpath $(CURDIR))
HOSTNAME := $(shell hostname)

all: vimdir vimrc gvimrc bash kerlrc tmux git xorg gemrc abcde

vim_clean:
	@rm -vf $(PROJDIR)/dot-vim/colors/solarized.vim
	@rm -vf $(PROJDIR)/dot-vim/set_utf8.vim
	@rm -vrf $(HOME)/.vim
	@rm -vf $(HOME)/.vimrc
	@rm -vf $(HOME)/.gvimrc

bash_clean:
	@rm -vf $(HOME)/.bashrc
	@rm -vf $(HOME)/.bash_aliases
	@rm -vf $(HOME)/.bash_profile

kerl_clean:
	@rm -vf $(HOME)/.kerlrc

tmux_clean:
	@rm -vf $(HOME)/.tmux.conf

git_clean:
	@rm -vf $(HOME)/.gitconfig
	@rm -vf $(HOME)/.gitconfig_custom
	@rm -vf $(HOME)/.gitignore_global

xorg_clean:
	@rm -vf $(HOME)/.xinitrc
	@rm -vf $(HOME)/.Xresources
	@rm -vf $(HOME)/.Xresources_custom

gemrc_clean:
	@rm -vf $(HOME)/.gemrc

abcde_clean:
	@rm -vf $(HOME)/.abcde.conf
	@rm -vf $(HOME)/.abcde-lame.conf

clean: vim_clean bash_clean kerl_clean tmux_clean git_clean xorg_clean gemrc_clean abcde_clean

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

git: $(HOME)/.gitconfig $(HOME)/.gitignore_global $(HOME)/.gitconfig_custom
$(HOME)/.gitconfig:
	ln -vsf $(PROJDIR)/dot-gitconfig $(HOME)/.gitconfig
$(HOME)/.gitconfig_custom:
	ln -vsf $(PROJDIR)/dot-gitconfig-$(HOSTNAME) $(HOME)/.gitconfig_custom
$(HOME)/.gitignore_global:
	ln -vsf $(PROJDIR)/dot-gitignore_global $(HOME)/.gitignore_global

gemrc: $(HOME)/.gemrc
$(HOME)/.gemrc:
	ln -vsf $(PROJDIR)/dot-gemrc $(HOME)/.gemrc

xorg: $(HOME)/.xinitrc $(HOME)/.Xresources $(HOME)/.Xresources_custom
$(HOME)/.Xresources:
	ln -vsf $(PROJDIR)/dot-Xresources $(HOME)/.Xresources
$(HOME)/.Xresources_custom:
	ln -vsf $(PROJDIR)/dot-Xresources-$(HOSTNAME) $(HOME)/.Xresources_custom
	xrdb -merge $(HOME)/.Xresources
$(HOME)/.xinitrc:
	ln -vsf $(PROJDIR)/dot-xinitrc $(HOME)/.xinitrc

abcde: $(HOME)/.abcde.conf $(HOME)/.abcde-lame.conf
$(HOME)/.abcde.conf:
	ln -vsf $(PROJDIR)/dot-abcde.conf $(HOME)/.abcde.conf
$(HOME)/.abcde-lame.conf:
	ln -vsf $(PROJDIR)/dot-abcde-lame.conf $(HOME)/.abcde-lame.conf
