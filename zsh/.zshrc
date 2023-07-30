# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/completions"
plug "zap-zsh/fzf"
plug "zap-zsh/sudo"
plug "zap-zsh/exa"
#plug "zap-zsh/nvm"
plug "wintermi/zsh-starship"

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
