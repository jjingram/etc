alias q='exit'
alias c='clear'
alias g='git'
alias j='jobs'
if [ $(uname) = 'Darwin' ]; then
	export EDITOR='mvim -v'
fi
alias e=$EDITOR
