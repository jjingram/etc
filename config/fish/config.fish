set -U EDITOR mvim -v
set PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin
set PATH $PATH ~/bin
# Texlive
set PATH $PATH /usr/texbin
# Go
set GOPATH $HOME/go
set PATH $PATH $GOPATH/bin /usr/local/opt/go/libexec/bin
# Haskell

alias e='mvim -v'
alias q='exit'
alias c='clear'
alias j='jobs'

fish_vi_mode

if not set -q TMUX
    exec tmux
end
