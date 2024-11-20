# # # # #
# PYTHON
alias python="python3"
alias py="python3"

# python virtual environments
# TODO: can we auto-activate when we cd into a project?
alias activate='[[ -d ./.venv ]] && source ./.venv/bin/activate >/dev/null 2>&1'
alias deac='deactivate'
alias mkenv='python -m venv .venv && source ./.venv/bin/activate >/dev/null 2>&1'
