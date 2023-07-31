#! /bin/zsh

VOID_PKGS="git stow curl neovim zsh zsh-completions zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting bat fzf fd ripgrep"

echo "Installing necesary distro packages..."
sudo xbps-install -Syu $VOID_PKGS 

echo "Installing Zsh plugin manager...."
stow git
stow zsh
git clone https://github.com/zap-zsh/zap.git "$ZDOTDIR/zap" --branch release-v1
source $HOME/.zshrc
#zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep

stow river
stow foot
stow yambar
stow swappy
stow sway

echo "Installing getnf for NerdFonts"
[[ -d "$HOME/.local/bin" ]] || mkdir -p "$HOME/.local/bin"
curl 'https://raw.githubusercontent.com/ronniedroid/getnf/master/getnf' -o "$HOME/.local/bin/getnf"
chmod u+x $HOME/.local/bin/getnf
export PATH=$PATH:$HOME/.local/bin
getnf
