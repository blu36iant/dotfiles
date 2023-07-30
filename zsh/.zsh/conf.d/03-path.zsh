#!/bin/zsh
[[ !-d "$HOME/.local/bin" ]] && mkdir -p $HOME/.local/bin
[[ ":$PATH:" != *":$HOME/.local/bin"* ]] && export PATH="$HOME/.local/bin:$PATH"
