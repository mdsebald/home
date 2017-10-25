PROJDIR := $(realpath $(CURDIR))
HOSTNAME := $(shell hostname | perl -pne 's/(.*?)\.local$$/lc($$1)/e')
HOMEDIR := $(realpath $(HOME))
HOME_BIN := $(HOMEDIR)/bin

.PHONY: all osx

all: misc vimdir vimrc gvimrc bash kerl kerlrc tmux git xorg gemrc abcde
osx: misc vimdir vimrc gvimrc bash kerl kerlrc tmux git gemrc

misc_clean:
	@rm -vf $(HOME_BIN)/urlencode

vim_clean:
	@rm -vf $(PROJDIR)/dot-vim/colors/solarized.vim
	@rm -vf $(PROJDIR)/dot-vim/set_utf8.vim
	@rm -vrf $(HOMEDIR)/.vim
	@rm -vf $(HOMEDIR)/.vimrc
	@rm -vf $(HOMEDIR)/.gvimrc

bash_clean:
	@rm -vf $(HOMEDIR)/.bashrc
	@rm -vf $(HOMEDIR)/.bash_aliases
	@rm -vf $(HOMEDIR)/.bash_profile

kerl_clean:
	@rm -vf $(HOME_BIN)/kerl
	@rm -vf $(HOMEDIR)/.kerlrc

tmux_clean:
	@rm -vf $(HOMEDIR)/.tmux.conf

git_clean:
	@rm -vf $(HOMEDIR)/.gitconfig
	@rm -vf $(HOMEDIR)/.gitconfig_custom
	@rm -vf $(HOMEDIR)/.gitignore_global

xorg_clean:
	@rm -vf $(HOME_BIN)/xstart
	@rm -vf $(HOMEDIR)/.xkb
	@rm -vf $(HOMEDIR)/.config/autostart/xstart.desktop
	@rm -vf $(HOMEDIR)/.xinitrc
	@rm -vf $(HOMEDIR)/.Xresources
	@rm -vf $(HOMEDIR)/.Xresources_custom

gemrc_clean:
	@rm -vf $(HOMEDIR)/.gemrc

abcde_clean:
	@rm -vf $(HOMEDIR)/.abcde.conf
	@rm -vf $(HOMEDIR)/.abcde-lame.conf

.PHONY: clean misc_clean vim_clean bash_clean kerl_clean tmux_clean git_clean xorg_clean gemrc_clean abcde_clean
clean: misc_clean vim_clean bash_clean kerl_clean tmux_clean git_clean xorg_clean gemrc_clean abcde_clean

$(HOME_BIN):
	mkdir -vp $(HOME_BIN)

misc: $(HOME_BIN)/urlencode
$(HOME_BIN)/urlencode: $(HOME_BIN)
	ln -vsf $(PROJDIR)/bin/urlencode $(HOME_BIN)/urlencode

vimdir: $(PROJDIR)/dot-vim/colors/solarized.vim $(PROJDIR)/dot-vim/set_utf8.vim $(HOMEDIR)/.vim
$(PROJDIR)/dot-vim/colors/solarized.vim:
	curl -Lo $(PROJDIR)/dot-vim/colors/solarized.vim \
		https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim

$(PROJDIR)/dot-vim/set_utf8.vim:
	curl -Lo $(PROJDIR)/dot-vim/set_utf8.vim \
		https://raw.githubusercontent.com/vim-scripts/set_utf8.vim/master/plugin/set_utf8.vim

$(HOMEDIR)/.vim:
	ln -vsf $(PROJDIR)/dot-vim $(HOMEDIR)/.vim

vimrc: $(HOMEDIR)/.vimrc
$(HOMEDIR)/.vimrc:
	ln -vsf $(PROJDIR)/dot-vimrc $(HOMEDIR)/.vimrc

gvimrc: $(HOMEDIR)/.gvimrc
$(HOMEDIR)/.gvimrc:
	ln -vsf $(PROJDIR)/dot-gvimrc $(HOMEDIR)/.gvimrc

bash: $(HOMEDIR)/.bashrc $(HOMEDIR)/.bash_aliases $(HOMEDIR)/.bash_profile
$(HOMEDIR)/.bashrc:
	ln -vsf $(PROJDIR)/dot-bashrc $(HOMEDIR)/.bashrc
$(HOMEDIR)/.bash_aliases:
	ln -vsf $(PROJDIR)/dot-bash_aliases $(HOMEDIR)/.bash_aliases
$(HOMEDIR)/.bash_profile:
	ln -vsf $(PROJDIR)/dot-bash_profile $(HOMEDIR)/.bash_profile

kerl: $(HOME_BIN)/kerl
$(HOME_BIN)/kerl: $(HOME_BIN)
	curl -o $(HOME_BIN)/kerl https://raw.githubusercontent.com/kerl/kerl/master/kerl
	chmod 755 $(HOME_BIN)/kerl

kerlrc: $(HOMEDIR)/.kerlrc
$(HOMEDIR)/.kerlrc:
	ln -vsf $(PROJDIR)/dot-kerlrc $(HOMEDIR)/.kerlrc

tmux: $(HOMEDIR)/.tmux.conf
$(HOMEDIR)/.tmux.conf:
	ln -vsf $(PROJDIR)/dot-tmux.conf $(HOMEDIR)/.tmux.conf

git: $(HOMEDIR)/.gitconfig $(HOMEDIR)/.gitignore_global $(HOMEDIR)/.gitconfig_custom
$(HOMEDIR)/.gitconfig:
	sed -e 's!%%HOME%%!$(HOMEDIR)!' $(PROJDIR)/dot-gitconfig > $(HOMEDIR)/.gitconfig
$(HOMEDIR)/.gitignore_global:
	ln -vsf $(PROJDIR)/dot-gitignore_global $(HOMEDIR)/.gitignore_global
$(HOMEDIR)/.gitconfig_custom:
	ln -vsf $(PROJDIR)/dot-gitconfig-$(HOSTNAME) $(HOMEDIR)/.gitconfig_custom

gemrc: $(HOMEDIR)/.gemrc
$(HOMEDIR)/.gemrc:
	ln -vsf $(PROJDIR)/dot-gemrc $(HOMEDIR)/.gemrc

xorg: $(HOMEDIR)/.xinitrc $(HOMEDIR)/.Xresources $(HOMEDIR)/.Xresources_custom $(HOMEDIR)/.xkb $(HOME_BIN)/xstart $(HOMEDIR)/.config/autostart/xstart.desktop
$(HOMEDIR)/.Xresources:
	ln -vsf $(PROJDIR)/dot-Xresources $(HOMEDIR)/.Xresources
$(HOMEDIR)/.Xresources_custom:
	ln -vsf $(PROJDIR)/dot-Xresources-$(HOSTNAME) $(HOMEDIR)/.Xresources_custom
	xrdb -merge $(HOMEDIR)/.Xresources
$(HOMEDIR)/.xinitrc:
	ln -vsf $(PROJDIR)/dot-xinitrc $(HOMEDIR)/.xinitrc
$(HOMEDIR)/.xkb:
	ln -vsf $(PROJDIR)/dot-xkb $(HOMEDIR)/.xkb
$(HOME_BIN)/xstart: $(HOME_BIN)
	ln -vsf $(PROJDIR)/bin/xstart $(HOME_BIN)/xstart
$(HOMEDIR)/.config/autostart/xstart.desktop:
	[ -f $(PROJDIR)/dot-config/autostart/xstart.desktop-$(HOSTNAME) ] && \
		ln -vsf $(PROJDIR)/dot-config/autostart/xstart.desktop-$(HOSTNAME) $(HOMEDIR)/.config/autostart/xstart.desktop

abcde: $(HOMEDIR)/.abcde.conf $(HOMEDIR)/.abcde-lame.conf
$(HOMEDIR)/.abcde.conf:
	ln -vsf $(PROJDIR)/dot-abcde.conf $(HOMEDIR)/.abcde.conf
$(HOMEDIR)/.abcde-lame.conf:
	ln -vsf $(PROJDIR)/dot-abcde-lame.conf $(HOMEDIR)/.abcde-lame.conf
