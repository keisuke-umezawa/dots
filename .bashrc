# alias
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

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
