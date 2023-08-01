#!/bin/sh

set -e

echo "Installing necesary distro packages..."
sudo xbps-install -Syu git stow curl shfmt unzip neovim zsh zsh-completions zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting bat fzf fd ripgrep

USR_SHELL=$(getent passwd $USER | awk -F: '{print $NF}')
[ "$USR_SHELL" != "/bin/zsh" ] && chsh -s /bin/zsh

stow river
stow foot
stow yambar
stow swappy
stow sway
stow git
stow zsh

#ZAP_URL='https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh'
echo "Installing Zsh plugin manager...."
git clone --branch release-v1 'https://github.com/zap-zsh/zap.git' "$HOME/.local/share/zap"
#curl "$ZAP_URL" | zsh -s -- "--branch" "release-v1" "--keep"

zsh -x<<EOF
source $HOME/.zshrc 
print "Installing getnf for NerdFonts..."
if command -v fc-cache &>/dev/null; then
  mkdir -p "$HOME/.local/bin"
  curl 'https://raw.githubusercontent.com/ronniedroid/getnf/master/getnf' -o "$HOME/.local/bin/getnf"
  chmod u+x $HOME/.local/bin/getnf
  $HOME/.local/bin/getnf<<EOFF
  8,13
  EOFF
  rm -rf NerdFonts
else
  print "Se precisa fontconfig para instalar las Nerd Fonts"
fi
print "Installing batmn-extras"
if command -v shfmt &>/dev/null; then
  git clone https://github.com/eth-p/bat-extras "$HOME/.local/src/bat-extras"
  cd "$HOME/.local/src/bat-extras"
  ./build.sh --install --minify=all --compress --prefix="$HOME/.local" 
  makewhatis "$HOME/.local/share/man"
else
  print "Se precisa shfmt para compilar los batman-extras"
fi
EOF
exec zsh
