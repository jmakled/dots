# A French Vanilla Setup

Trying to keep my configuration as minimal & "vanilla" as possible, but adding some essential quality-of-life improvements.

Structure is rudimentary, and there's probably a better way to do it, but as an example:

`apps/` - Most CLI programs

`gui/` - Any GUI-driven program

`shell/` - Bash/Zsh/Fish

```
├── apps
│   ├── fzf
│   │   └── aliases.bash
│   ├── git
│   │   ├── aliases.bash
│   │   └── gitignore
│   ├── tmux
│   │   ├── aliases.bash
│   │   └── tmux.conf
│   └── vim
│       └── vimrc
├── gui
│   └── alacritty
│       ├── theming
│       └── alacritty.toml
└── shell
    └── bash
        ├── scripts
        ├── aliases.bash
        ├── bash_profile
        └── bashrc
```

## Setup

> [!NOTE] Makes heavy use of `git`, `fzf`, and `python3`.

- `vim` is here as a "default". `nvim` available [here](https://gitlab.com/lazylab/lazyvim-config.git)
  `setup.sh` removes the relevant files in $HOME and re-links the necessary files here.
