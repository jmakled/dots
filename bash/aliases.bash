# CONFIG
alias dots="$EDITOR ~/.dotfiles/README.md"

## Enable aliases to be sudo’ed
alias sudo='sudo '

# EDITING
alias n="nvim"
alias v="vim"

## Notes
export NOTE_DIR="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/notebook"
alias notes="$EDITOR '$NOTE_DIR/index.md'"
daily() {
    local file=$NOTE_DIR/journal/daily_pages/$(date +%Y)/$(date +%Y-%m-%d).md
    [[ -f "$file" ]] && nvim "$file" || echo "Daily Page not found!\n$file"
}

# NAVIGATION
## TODO: oughta turn this into a function or something
alias cd="cd -P"
alias cdd="cd .."
alias cddd="cd ../.."

## Always use color output for `ls`
alias ls="command ls -G"
## all files, color, long format, excluding . and ..
alias ll="ls -lAFG"

## Shamelessly stolen from https://github.com/mathiasbynens/dotfiles/blob/main/.functions
function tre() {
    tree -aC -L 3 -I '.git|data|__pycache__|.vscode|node_modules|.venv' --dirsfirst "$@" | less -FRX
}

# NETWORK
## TODO: probably a prettier way of doing this...
alias dip="ifconfig | grep 'inet ' | awk '{print \$2}'" # macos
# alias dip="ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}'" # linux
alias eip='dig +short myip.opendns.com @resolver1.opendns.com'

# PACKAGE MANAGER
## TODO: this should get replaced based on whatever the installed package manager is
alias sup='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y' # APT
alias brup='brew update && brew upgrade'                                     # BREW
