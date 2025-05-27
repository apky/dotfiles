# .zshrc is for interactive shells. executes after .zprofile

# Display Message of the Day (MOTD)
[[ ! -f ~/.motd.zsh ]] || source ~/.motd.zsh

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
  # autoload -Uz promptinit && promptinit && prompt powerlevel10k
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

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

#### END User configuration ####

# starship prompt
! type starship &>/dev/null || eval "$(starship init zsh)"