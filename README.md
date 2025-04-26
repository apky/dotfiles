⚠️ `install.conf.yaml` is set to _force_ links, meaning it will delete any existing dotfiles it wants to replace with symlinks.

```
cd ~
git clone git@github.com:apky/dotfiles.git --recursive

# if setting up a new machine, run this script to install software and set preferences
cp dotfiles/macos .macos && ./.macos

# install dotfiles
cd dotfiles && ./install
```

To upgrade your submodules to their latest versions, periodically run `git submodule update --init --remote`