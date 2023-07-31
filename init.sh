#! /bin/zsh

echo "Installing necesary distro packages..."
sudo xbps-install -Syu git stow curl unzip neovim zsh zsh-completions zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting bat fzf fd ripgrep

echo "Installing Zsh plugin manager...."
stow git
stow zsh
#git clone --branch release-v1 https://github.com/zap-zsh/zap.git "$HOME/.config/zsh/zap"
#source $HOME/.zshrc 
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep

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
getnf<<EOF
8,13,17,18,21,27,28,30,31,32,34,41,47,51

EOF
rm -rf NerdFonts
chsh -s /bin/zsh
