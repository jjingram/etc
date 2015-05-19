alias q='exit'
alias c='clear'
if [ $(uname) = 'Darwin' ]; then
	export EDITOR='mvim -v'
fi
alias e=$EDITOR
