#!/bin/sh

DOTFILES_DIR=$(cd $(dirname $0) && pwd)

# bash settings
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
ln -sf ${DOTFILES_DIR}/.bash_profile ~/.bash_profile
ln -sf ${DOTFILES_DIR}/.bashrc ~/.bashrc
ln -sf ${DOTFILES_DIR}/.profile ~/.profile
ln -sf ${DOTFILES_DIR}/.tmux.conf ~/.tmux.conf
ln -sf ${DOTFILES_DIR}/.gitconfig ~/.gitconfig

# vim settings
ln -sf ${DOTFILES_DIR}/.vimrc ~/.vimrc
if [ -e ~/.vim ]; then
	rm -rf ~/.vim
fi
mkdir -p ~/.vim/bundle/
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

if [ ! -e ~/bin ]; then
    mkdir -p ~/bin
fi
cp ${DOTFILES_DIR}/bin/* ~/bin/

# setup pyenv
if [ ! -e ~/.pyenv ]; then
    git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi
