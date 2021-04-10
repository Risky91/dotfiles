#ls aliases
alias ll="ls -lhA"
alias la="ls -CFa"
alias ls="ls -CF --color=auto"
alias sl="ls"
alias lsl="ls -lhfA | less"

# colorize dir
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"

# easier directory traversal
alias ..="cd .."
alias -="cd -"
alias home="cd ~"
alias root="cd /"

# colorize grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias vgrep="vgrep --color=auto"

# add error protection to rm
alias rm="rm -I"

# copy recursively if directory, verbose
alias cp="cp -rv"

# verbose move
alias mv="mv -v" 

# automatically create parents, verbose
alias mkdir="mkdir -pv"

# continue if needed
alias wget="wget -c"

# quick clear (needed? C-L?)
alias c="clear"

alias sudo="sudo "

# add executable
alias chx="chmod +x"

# git aliases
alias ga="git add"
alias gcm="git commit -m"
alias gb="git branch"
alias gs="git status"
