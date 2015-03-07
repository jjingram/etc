alias q='exit'
alias c='clear'
if [ $(uname) = 'Darwin' ]; then
	alias e='mvim -v'
else
	alias e='vim'
fi
