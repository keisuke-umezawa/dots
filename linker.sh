#!/bin/sh

DOTFILES_DIR=$(cd $(dirname $0) && pwd)

# bash settings
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
ln -sf ${DOTFILES_DIR}/.bash_profile ~/.bash_profile
ln -sf ${DOTFILES_DIR}/.bashrc ~/.bashrc
ln -sf ${DOTFILES_DIR}/.tmux.conf ~/.tmux.conf
ln -sf ${DOTFILES_DIR}/.gitconfig ~/.gitconfig
ln -sf ${DOTFILES_DIR}/.zshrc ~/.zshrc
ln -sf ${DOTFILES_DIR}/.vimrc ~/.vimrc

# zsh settings
if [ ! -e ~/.zplug ]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

# vim settings
if [ ! -e ~/.vim ]; then
    mkdir -p ~/.vim/bundle/
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

# bin setting
if [ ! -e ~/bin ]; then
    mkdir -p ~/bin
fi
cp ${DOTFILES_DIR}/bin/* ~/bin/

# setup pyenv
if [ ! -e ~/.pyenv ]; then
    git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi
