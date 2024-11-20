# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf

eval "$(fzf --bash)"

#
## My config... ##
#

# this is set to the default, leaving it here for reference
export FZF_COMPLETION_TRIGGER='**'

# mimicking fd behavior by -not -path hidden dirs
export FZF_DEFAULT_COMMAND='find . -not -path "*/\.git/*" -not -path "*/\.*" -not -path "*/*cache*/*"'

# export FZF_COMPLETION_OPTS='--info=inline'
export FZF_DEFAULT_OPTS="
  --layout reverse
  --info inline
  --border
  --header 'CTRL-Y to copy selection to clipboard'
  --bind 'ctrl-p:change-preview-window(down|hidden|right)'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'"

# FZF theme - Dracula
export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
export FZF_TMUX_OPTS="-p"

export FZF_COMPLETION_DIR_COMMANDS="cd tree ls"

# Keybinding tweaks
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND -type f"
export FZF_CTRL_T_OPTS="
  --preview 'cat {} | head'
  --preview-window left,20%,border-bold
  --preview-label 'find file'"

# cd'ing into directories w/ fzf...
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND -type d"
export FZF_ALT_C_OPTS=""

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_COMMAND="$FZF_DEFAULT_COMMAND -type f"
export FZF_CTRL_R_OPTS="
--preview 'man \"$(echo {} | awk '{print $1}')\"'
  --preview-window right:3:hidden:wrap
  --preview-label 'cmd history'
  --bind 'ctrl-p:toggle-preview'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

_fzf_compgen_path() {
    find . -type f \
        -not -path "*/\.git/*" \
        -not -path "*/Library/*" \
        -not -path "*/Pictures/*" \
        -not -path "*/Music/*" \
        -not -path "*/\.*" \
        -not -path "*/*cache*/*" \
        -not -path "*/node_modules/*" \
        -not -path "*/.tmp/*" \
        -not -name "*.tmp" \
        -not -path "*/.cache/*" \
        -not -path "*/venv/*" \
        -not -path "*/env/*" \
        -not -path "*/.venv/*" \
        -not -path "*/.vscode/*" \
        "$1"
}
