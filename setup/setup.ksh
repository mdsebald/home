#!/usr/bin/env ksh
# vim:sw=2:ts=2:expandtab

set -o nounset
set -o errexit

function pmsg
{
  print -u1 "[info] $@"
}

function perr
{
  print -u2 "[error] $@"
}

function errexit
{
  perr "$@"
  exit 1
}

if [[ -z $HOME ]]
then
  errexit "Environment variable '\$HOME' must be set."
fi

if [[ -f $HOME/.dotfiles-ready ]]
then
  errexit "$HOME/.dotfiles-ready exists, nothing to do"
fi

dotfiles="$HOME/dotfiles"
if [[ ! -d $dotfiles/.git ]]
then
  errexit "$dotfiles/.git directory must exist."
fi

if [[ -d $HOME/.vim ]]
then
  pmsg "$HOME/.vim exists, moving to $HOME/.vim-bak"
  mv -vf "$HOME/.vim" "$HOME/.vim-bak"
fi

ln -vs "$dotfiles/vim" "$HOME/.vim"
ln -vs "$dotfiles/tmux/tmux.conf" "$HOME/.tmux.conf"

# TODO: if FreeBSD / other OS
for sh_init in shrc bashrc kshrc cshrc profile
do
  dotfile="$HOME/.$sh_init"
  dotfilebak="$HOME/${sh_init}-bak"
  if [[ -f $dotfile ]]
  then
    pmsg "$dotfile exists, moving to $dotfilebak"
    mv -vf "$dotfile" "$dotfilebak"
  fi
  ln -v "$dotfiles/sh-init/$sh_init" "$dotfile"
done

# TODO: if FreeBSD
ln -v "$dotfiles/sh-init/csh-login" "$HOME/.login"

# Fin
touch "$HOME/.dotfiles-ready"
