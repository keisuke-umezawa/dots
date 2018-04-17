# for pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
    #eval "$(pyenv virtualenv-init -)"
fi

# for cuDNN
export LD_LIBRARY_PATH=~/.cudnn/active/cuda/lib64:$LD_LIBRARY_PATH
export CPATH=~/.cudnn/active/cuda/include:$CPATH
export LIBRARY_PATH=~/.cudnn/active/cuda/lib64:$LIBRARY_PATH
export PATH=/usr/local/cuda-8.0/bin:$PATH

# ~/bin
path=$HOME/bin
if [ -d $path ]; then
    export PATH=$PATH:$path
fi

# ranger
function ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        `which ranger` $@
    else
        exit
    fi
}

# forward agent with tmux
agent="$HOME/.ssh/agent"
if [ -S "$SSH_AUTH_SOCK" ]; then
    case $SSH_AUTH_SOCK in
    /tmp/*/agent.[0-9]*)
        ln -snf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent
    esac
elif [ -S $agent ]; then
    export SSH_AUTH_SOCK=$agent
else
    echo "no ssh-agent"
fi
