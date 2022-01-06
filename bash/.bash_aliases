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

#alias -="cd -"
alias home="cd ~"
alias root="cd /"

# colorize grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias vgrep="vgrep --color=auto"

# add error protection to rm, verbose, recursive
alias rm="rm -rvI"

# copy recursively if directory, verbose
alias cp="cp -riv"

# verbose move
alias mv="mv -iv" 

# automatically create parents, verbose
alias mkdir="mkdir -pv"

# continue if needed
alias wget="wget -c"

# quick clear (needed? C-L?)
alias c="clear"

# sudo aliases
alias sudo="sudo "
alias please='sudo $(fc -ln -1)'

# add executable
alias chx="chmod +x"

# use htop instead of top
alias top="htop"

# use ncdu instead of du
alias du="ncdu"

# git aliases
alias ga="git add"
alias gcm="git commit -m"
alias gb="git branch"
alias gs="git status"

# weather
alias weather="curl wttr.in"
alias weatherex="curl v2.wttr.in"

# googler
alias google="googler"

#calcurses
alias calendar="calcurse"

#wikit
alias wiki="wikit"

#replace vim with nvim
alias vim="nvim"
