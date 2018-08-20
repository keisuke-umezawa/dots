# history
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

bindkey -e

# history search
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# zplug
source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "b4b4r07/enhancd", use:init.sh
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
# highlight
zplug "zsh-users/zsh-syntax-highlighting"
# history
zplug "zsh-users/zsh-history-substring-search"
# git alias
zplug "plugins/git",   from:oh-my-zsh
# complete typing
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load 

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

# for dstat
alias dstat-full='dstat -Tclmdrn'
alias dstat-mem='dstat -Tclm'
alias dstat-cpu='dstat -Tclr'
alias dstat-net='dstat -Tclnd'
alias dstat-disk='dstat -Tcldr'

# for docker
alias docker-kill-all='docker ps -q | xargs docker stop | xargs docker rm'

# for rsync
alias rsync-nv="rsync -auvz -e ssh ~/dev/alpaca/ keisuke-umezawa@nv-2:dev/ --exclude='.python-version' --exclude='.git'"

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
