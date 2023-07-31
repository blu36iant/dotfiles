#check if editor exists
if command -v nvim &> /dev/null; then
	alias -g vi='nvim'
elif command -v vim &> /dev/null; then
	alias -g vi='vim'
else
	echo "No existen los binarios de 'nvim' y/o 'vim', UNIX vi fallback EDITOR"
fi

