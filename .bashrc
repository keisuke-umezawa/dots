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

PS1_COLOR_BEGIN="\[\e[1;32m\]"
PS1_COLOR_END="\[\e[m\]"
if [ "x$YROOT_NAME" != "x" ]; then
  export PS1="[${PS1_COLOR_BEGIN}\u${PS1_COLOR_END}@\h:$YROOT_NAME \W]\\$ "
else
  export PS1="[${PS1_COLOR_BEGIN}\u${PS1_COLOR_END}@\h \W]\\$ "
fi
