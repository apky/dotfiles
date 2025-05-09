# .zshrc is for interactive shells. executes after .zprofile

# Display Message of the Day (MOTD)
[[ ! -f ~/.motd.zsh ]] || source ~/.motd.zsh

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

# Load Antigen
source $(brew --prefix)/share/antigen/antigen.zsh

# Use Oh-My-Zsh
antigen use oh-my-zsh

# ohmyzsh plugins
antigen bundle git
antigen bundle alias-finder
antigen bundle dotenv
# antigen bundle poetry # seems to be a bit broken
antigen bundle kubectl
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# aliases
antigen bundle ~/dotfiles/oh-my-zsh/custom

# ohmyzsh themes
antigen theme romkatv/powerlevel10k

# Apply antigen stuff defined above
antigen apply


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
