# .zshrc is for interactive shells. executes after .zprofile

# Display Message of the Day (MOTD)
[[ ! -f ~/.motd.zsh ]] || source ~/.motd.zsh

# use antidote for plugin management
if [[ -r "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh" ]]; then
  # use friendly names for cache directories
  zstyle ':antidote:bundle' use-friendly-names 'yes'

  source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"

  # initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
  antidote load

  # load the output of 'antidote load'
  source ~/.zsh_plugins.zsh

  # load powerlevel10k prompt plugin
  autoload -Uz promptinit && promptinit && prompt powerlevel10k
fi

#### BEGIN User configuration ####

# kubectl settings
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# "n" - interactively manage Node.js versions
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# pipx 
export PATH="$PATH:/Users/alexpowell/.local/bin"

#### END User configuration ####

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
