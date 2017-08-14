#PATH=$PATH:$HOME/bin
## for pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
    #eval "$(pyenv virtualenv-init -)"
fi

## for cuDNN
#export LD_LIBRARY_PATH=~/.cudnn/active/cuda/lib64:$LD_LIBRARY_PATH
#export CPATH=~/.cudnn/active/cuda/include:$CPATH
#export LIBRARY_PATH=~/.cudnn/active/cuda/lib64:$LIBRARY_PATH

## golang
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
