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

# forward agent with tmux
#agent="$HOME/.ssh/agent"
#if [ -S "$SSH_AUTH_SOCK" ]; then
#    case $SSH_AUTH_SOCK in
#    /tmp/*/agent.[0-9]*)
#        ln -snf "$SSH_AUTH_SOCK" $agent && export SSH_AUTH_SOCK=$agent
#    esac
#elif [ -S $agent ]; then
#    export SSH_AUTH_SOCK=$agent
#else
#    echo "no ssh-agent"
#fi

## yjs
if [ "x$YROOT_NAME" != "x" ]; then
  PS1='[\u@\H:$YROOT_NAME \w]\n\$ '
else
  PS1='[\u@\H \w]\n\$ '
fi
alias vim=~/bin/vim
export USE_CCACHE=1
export CCACHE_DIR=~/tmp/.ccache
export YJS_HOME=~/dev/yjs
export YJS_LOG_DIR=~/dev/yjs_log
export YJS_CONF_DIR=~/dev/yjs/core/tests/helper/etc/
