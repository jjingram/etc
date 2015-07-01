set -U EDITOR vim
set PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin
# Texlive
set PATH $PATH /usr/texbin
# Go
set GOPATH $HOME/go
set PATH $PATH $GOPATH/bin /usr/local/opt/go/libexec/bin
# Haskell
set PATH $PATH $HOME/.cabal/bin

alias e='vim'
alias q='exit'
alias c='clear'
alias j='jobs'

fish_vi_mode

if not set -q TMUX
    exec tmux
end
