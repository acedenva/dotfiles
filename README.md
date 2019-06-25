# dotfiles
## Preamble
By default git-clone always needs a new directory to create the git working dir.
git seperate directories for working tree and git folder

## Initial Setup
```
git clone --bare url ~/.dotfiles
cd ~
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout
./init.bash
```


bare repository

init
  alias gid
  bashrc source
  
