if command -v battman &> /dev/null; then
	alias -g man='batman'
else
	echo "Bajando el plugin de colored-manpages de oh-my-zsh e importandolo en snap"
	# curl 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/colored-man-pages/colored-man-pages.plugin.zsh' -o "$HOME/.local/share/zsh_local/"
fi
