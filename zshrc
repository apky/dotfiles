# .zshrc is for interactive shells. executes after .zprofile

# Display Message of the Day (MOTD)
[[ ! -f ~/.motd.zsh ]] || source ~/.motd.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# use antidote for plugin management
if [[ -r "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh" ]]; then
  # use friendly names for cache directories
  zstyle ':antidote:bundle' use-friendly-names 'yes'

  # Available completion styles: gremlin, ohmy, prez, zshzoo
  # You can add your own too. To see all available completion styles
  # run 'compstyle -l'
  zstyle ':plugin:ez-compinit' 'compstyle' 'zshzoo'

  source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"

  # initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
  antidote load

  # load powerlevel10k prompt plugin
  autoload -Uz promptinit && promptinit && prompt powerlevel10k
fi

#### BEGIN User configuration ####

# Default coloring for BSD-based ls
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# gcloud settings
[[ ! -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ]] || source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
[[ ! -f "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc" ]] || source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# "n" - interactively manage Node.js versions
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# variables for zpm-zsh/autoenv
export AUTOENV_IN_FILE=".env"
export AUTOENV_OUT_FILE=".env.out"

# zsh directory stack
setopt AUTO_PUSHD           # Push the current directory visited on the stack
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd

#### END User configuration ####

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
