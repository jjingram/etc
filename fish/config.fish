set -U EDITOR mvim -v
set PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin
# Texlive
set PATH $PATH /usr/texbin
# Go
set GOPATH $HOME/go
set PATH $PATH $GOPATH/bin /usr/local/opt/go/libexec/bin
# Cabal
set PATH $PATH $HOME/.cabal/bin

alias e='mvim -v'
alias q='exit'
alias c='clear'
alias j='jobs'

fish_vi_mode

# Base16 Shell colours
eval sh ~/etc/color/base16-shell/base16-google.light.sh

if not set -q TMUX
    exec tmux
end
