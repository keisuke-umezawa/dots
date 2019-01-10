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

# for dstat
alias dstat-full='dstat -Tclmdrn'
alias dstat-mem='dstat -Tclm'
alias dstat-cpu='dstat -Tclr'
alias dstat-net='dstat -Tclnd'
alias dstat-disk='dstat -Tcldr'

# for docker
alias docker-kill-all='docker ps -q | xargs docker stop | xargs docker rm'

# for rsync
alias rsync-nv="rsync -auvz -e ssh ~/dev/alpaca/ keisuke-umezawa@nv-0:dev/ --exclude='.python-version' --exclude='.git'"

# git completion
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

# ~/bin
BIN=$HOME/bin
if [ -d "${BIN}" ]; then
    export PATH=$PATH:$BIN
fi

# for pyenv
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=$PYENV_ROOT/bin:$PATH
    eval "$(pyenv init -)"
    #eval "$(pyenv virtualenv-init -)"
fi

# chainerui
function chainerui() {
    docker run \
    -v $(readlink -f $1):$(readlink -f $1) \
    -p ${2:-5000}:5000 \
    -d \
    --rm \
    --name ${2:-5000} \
    -it chainer/chainerui:v0.4.0 \
    bash -c \
    "chainerui project create -d $(readlink -f $1);
    chainerui server --host 0.0.0.0"
}

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

PS1="\\[\\e[32m\\][\\u@\\h \\w]\\[\\e[0m\\]\\n\\$ "

# for mac
# export PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
# export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}
