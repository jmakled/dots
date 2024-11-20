# Set Bash prompt w/ git branch
parse_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\e[34m\]\u\[\e[00m\]@\[\e[34m\]\h \[\e[32m\]\w\[\e[91m\]\$(parse_git_branch)\n\[\e[00m\]$ "

alias gs='git status'
alias gbl='git branch -l'
alias gc='git checkout'
alias gup='git fetch && git pull'
alias lg='lazygit'

# git + fzf

# git checkout branches
function gbr() {
    local branches branch
    branches=$(git branch) &&
        branch=$(echo "$branches" | fzf-tmux -h 15 +m) &&
        git checkout $(echo "$branch" | sed "s/.* //")
}
