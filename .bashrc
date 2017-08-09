export PS1="[\u@\h \w]\n\\$ "
# alias
case "${OSTYPE}" in
darwin*)
  alias ls="ls -G"
  alias ll="ls -lG"
  alias la="ls -laG"
  ;;
linux*)
  alias ls='ls --color'
  alias ll='ls -l --color'
  alias la='ls -la --color'
  ;;
esac

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias vi='vim'

# for debug
alias objdump='objdump -M'

# git completion
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

# for pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#PATH=$PYENV_ROOT/bin:$PATH
#PATH=$PATH:$HOME/bin
#export PATH
#eval "$(pyenv init -)"

# for cuDNN
#export LD_LIBRARY_PATH=~/.cudnn/active/cuda/lib64:$LD_LIBRARY_PATH
#export CPATH=~/.cudnn/active/cuda/include:$CPATH
#export LIBRARY_PATH=~/.cudnn/active/cuda/lib64:$LIBRARY_PATH
