export PS1="[\u@\h \w]\n\\$ "
# alias
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

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
#alias vi='gvim'
#alias grep='grep -E'
#alias sed='sed -r'
#alias awk='gawk --posix'
export PYENV_ROOT="$HOME/.pyenv"
PATH=$PYENV_ROOT/bin:$PATH
PATH=$PATH:$HOME/bin
export PATH
eval "$(pyenv init -)"

#for CentOS
setxkbmap jp
