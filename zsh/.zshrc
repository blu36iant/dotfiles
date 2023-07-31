# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/completions"
plug "zap-zsh/fzf"
plug "zap-zsh/sudo"
plug "zap-zsh/exa"
plug "romkatv/powerlevel10K"

# Load and initialise completion system
autoload -Uz compinit
compinit

#Load custom config files
for conf in "$HOME/.zsh/conf.d/"*.zsh; do
  source "${conf}"
done
unset conf

#Load custom aliases
if [ -f "$HOME/.zshalias" ]; then
    source ~/.zshalias
else
    print "404: ~/.zsh/zshalias not found."
fi

#Autoload custom functions
if [ -d "$HOME/.zsh/functions" ]; then
   fpath=( ~/.zsh/functions "${fpath[@]}")
   autoload -Uz $fpath[1]/*(.:t)
else
    print "404: ~/.zsh/functions not found."
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
