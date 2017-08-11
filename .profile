#PATH=$PATH:$HOME/bin
## for pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#PATH=$PYENV_ROOT/bin:$PATH
#export PATH
#eval "$(pyenv init -)"

## for cuDNN
#export LD_LIBRARY_PATH=~/.cudnn/active/cuda/lib64:$LD_LIBRARY_PATH
#export CPATH=~/.cudnn/active/cuda/include:$CPATH
#export LIBRARY_PATH=~/.cudnn/active/cuda/lib64:$LIBRARY_PATH

## golang
export GOROOT=/usr/local/opt/go/linexec
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
