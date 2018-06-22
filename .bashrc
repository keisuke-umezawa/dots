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

# git completion
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi


PS1="\\[\\e[32m\\][\\u@\\h \\w]\\[\\e[0m\\]\\n\\$ "
