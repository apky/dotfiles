```
cd ~
git clone git@github.com:apky/dotfiles.git --recursive

# if setting up a new machine, run this script to install software and set preferences
cp dotfiles/macos .macos && ./.macos

# install dotfiles
cd dotfiles && ./install
```

To upgrade your submodules to their latest versions, you could periodically run `git submodule update --init --remote`