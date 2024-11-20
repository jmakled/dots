#! /bin/bash

files_to_remove=(
    .bashrc
    .tmux.conf
    .vimrc
    .bash_profile
    .config/alacritty/alacritty.toml
)

# Remove the files
for file in "${files_to_remove[@]}"; do
    if [[ -e $file ]]; then
        rm -f "$HOME $file"
    fi
done

# Re-Link the necessary stuff
ln -s ~/.dotfiles/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -s ~/.dotfiles/bash/bash_profile ~/.bash_profile
ln -s ~/.dotfiles/bash/bashrc ~/.bashrc
ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
