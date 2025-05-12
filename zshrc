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

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# User configuration

# kubectl settings
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# "n" - interactively manage Node.js versions
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# pipx 
export PATH="$PATH:/Users/alexpowell/.local/bin"

# aliases
source ~/dotfiles/oh-my-zsh/custom/alias.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
