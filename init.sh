#/bin/sh

VOID_PKGS='git stow neovim zsh zsh-completions curl bat starship fzf'

echo "Installing necesary distro packages..."
sudo xbps-install -Syu -n $VOID_PKGS 

echo "Installing getnf for NerdFonts"
curl 'https://raw.githubusercontent.com/ronniedroid/getnf/master/getnf' -o $home/.local/bin/getnf

echo "Installing Zsh plugin manager...."
stow zsh
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep

stow river
stow yambar
