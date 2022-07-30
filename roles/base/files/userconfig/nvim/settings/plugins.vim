call plug#begin('~/local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'                			" status bar

Plug 'francoiscabrol/ranger.vim'            			" ranger file manager
Plug 'rbgrouleff/bclose.vim'                			" necessary plugin for ranger

Plug 'airblade/vim-gitgutter'               			" show added/changed lines in git repos
Plug 'ntpeters/vim-better-whitespace'       			" highlight unnecessary whitespace

Plug 'neoclide/coc.nvim', {'branch': 'release'} 	" autocomplete

Plug 'tpope/vim-fugitive'                   			" Git integration
Plug 'tpope/vim-surround'													" Surroundings (parantheses, brackets, quotes, tags)
Plug 'tpope/vim-repeat'														" Repeat non-native commands with '.'
Plug 'tpope/vim-commentary' 											" Toggle comments with gcc


Plug 'junegunn/goyo.vim' 													" Distraction-free viewing
Plug 'junegunn/limelight.vim' 										" Hyperfocus on a range
Plug 'jiangmiao/auto-pairs' 											" Insert brackets in pairs

call plug#end()

source $HOME/.config/nvim/plug-settings/lightline.vim
source $HOME/.config/nvim/plug-settings/ranger.vim
source $HOME/.config/nvim/plug-settings/rust.vim
source $HOME/.config/nvim/plug-settings/coc.vim
