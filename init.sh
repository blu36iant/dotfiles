#/bin/sh

VOID_PKGS='git stow nvm neovim zsh zsh-zsh-completions curl bat fzf'

echo "Installing necesary distro packages..."
sudo xbps-install -Syu $VOID_PKGS 

echo "Installing Zsh plugin manager...."
stow zsh
git clone -b "--release-v1" https://github.com/zap-zsh/zap.git "$HOME/.config/zsh/zap"
source $HOME/.zshrc
#zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep

stow river
stow yambar

echo "Installing getnf for NerdFonts"
[[ -d "$HOME/.local/bin" ]] || mkdir -p "$HOME/.local/bin"
curl 'https://raw.githubusercontent.com/ronniedroid/getnf/master/getnf' -o "$HOME/.local/bin/getnf"

