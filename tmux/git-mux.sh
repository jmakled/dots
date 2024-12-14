#!/bin/bash

REPO_ROOT=$(git rev-parse --show-toplevel)
REPO_NAME=$(basename "$REPO_ROOT")
# Create a new tmux session with the repository name
tmux new-session -d -s "$REPO_NAME"
tmux split-window -v -p 20 -t "$REPO_NAME"
# tmux new-window -t "$REPO_NAME" -n "notes" "nvim"
tmux attach -t "$REPO_NAME"
