call plug#begin('~/local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'                			" status bar

Plug 'airblade/vim-gitgutter'               			" show added/changed lines in git repos
Plug 'ntpeters/vim-better-whitespace'       			" highlight unnecessary whitespace

Plug 'kyazdani42/nvim-web-devicons' 							" optional, for file icons
Plug 'kyazdani42/nvim-tree.lua' 									" file explorer

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Golang

Plug 'neoclide/coc.nvim', {'branch': 'release'} 	" autocomplete

Plug 'tpope/vim-fugitive'                   			" Git integration
Plug 'tpope/vim-surround'													" Surroundings (parantheses, brackets, quotes, tags)
Plug 'tpope/vim-repeat'														" Repeat non-native commands with '.'
Plug 'tpope/vim-commentary' 											" Toggle comments with gcc


Plug 'junegunn/goyo.vim' 													" Distraction-free viewing
Plug 'junegunn/limelight.vim' 										" Hyperfocus on a range
Plug 'jiangmiao/auto-pairs' 											" Insert brackets in pairs

Plug 'morhetz/gruvbox' 														" Gruvbox theme

call plug#end()

source $HOME/.config/nvim/plug-settings/lightline.vim
source $HOME/.config/nvim/plug-settings/ranger.vim
source $HOME/.config/nvim/plug-settings/rust.vim
source $HOME/.config/nvim/plug-settings/coc.vim
source $HOME/.config/nvim/plug-settings/gruvbox.vim
source $HOME/.config/nvim/plug-settings/nvimtree.vim
