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

# dein settings
if [ ! -e ~/.cache/dein ]; then
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein
    mkdir ~/.cache/dein/config
    ln -sf ${DOTFILES_DIR}/dein.toml ~/.cache/dein/config/dein.toml
    ln -sf ${DOTFILES_DIR}/dein_lazy.toml ~/.cache/dein/config/dein_lazy.toml
    rm ./installer.sh
fi

# bin setting
if [ ! -e ~/bin ]; then
    mkdir -p ~/bin
fi
cp ${DOTFILES_DIR}/bin/* ~/bin/

# setup pyenv
if [ ! -e ~/.pyenv ]; then
    git clone https://github.com/yyuu/pyenv.git ~/.pyenv
    git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
fi
