#!/bin/bash

# Create the necessary directories and files
mkdir -p ~/.vim/colors
touch ~/.vimrc

# Set Vim preferences
cat <<EOF >> ~/.vimrc
syntax on
set autoindent
set smartindent
set number
set mouse=a
colorscheme sublimemonokai
EOF

# Download the Sublime Monokai color scheme
curl "https://raw.githubusercontent.com/ErichDonGubler/vim-sublime-monokai/master/colors/sublimemonokai.vim" --output ~/.vim/colors/sublimemonokai.vim

echo "Vim configuration complete!"



#!/bin/bash

# check if ~/.vim directory exists
if [ ! -d ~/.vim ]; then
	# create the directory and sub-directory
	mkdir -p ~/.vim/colors
	# create the .vimrc file
	touch ~/.vimrc
fi

# add configuration to .vimrc file
echo "syntax on
set autoindent
set smartindent
set number
set mouse=a
" >> ~/.vimrc

# download and add color scheme to .vim/colors directory
curl -sS "https://raw.githubusercontent.com/ErichDonGubler/vim-sublime-monokai/master/colors/sublimemonokai.vim" --output ~/.vim/colors/sublimemonokai.vim

# add the color scheme to .vimrc file
echo "colorscheme sublimemonokai" >> ~/.vimrc