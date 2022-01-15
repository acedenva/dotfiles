# dotfiles
## Notes
By default git-clone always needs a new directory to create the git working directory.
git has seperate directories for working tree and git folder

## Initial Setup
```
git clone --bare url ~/.dotfiles
cd ~
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout
./init.bash
source .bash_aliases
```
  
## Color Specific Settings
### terminal
$TERM xterm-256color

### .vimrc
```
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
```

### .tmux.conf
```
set -g default-terminal "tmux-256color"
set -ga terminal-overrides ",*256col*:Tc"
```
