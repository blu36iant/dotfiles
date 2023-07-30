if command -v battman &> /dev/null; then
	alias -g man='batman'
else
	source "$(curl 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/colored-man-pages/colored-man-pages.plugin.zsh')"
fi
