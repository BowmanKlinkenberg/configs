# git repo context
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\H:\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\]\$ "
# colorize
export CLICOLOR=1
# Set up direnv integration
eval "$(direnv hook bash)"

# aliases
alias ll='ls -al'
