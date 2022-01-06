call plug#begin('~/local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'                " status bar
Plug 'tpope/vim-fugitive'                   " git integration

Plug 'francoiscabrol/ranger.vim'            " ranger file manager
Plug 'rbgrouleff/bclose.vim'                " necessary plugin for ranger

Plug 'airblade/vim-gitgutter'               " show added/changed lines in git repos
Plug 'ryanoasis/vim-devicons'               " show icons in nerdtree
Plug 'ntpeters/vim-better-whitespace'       " highlight unnecessary whitespace
Plug 'dense-analysis/ale'                   " linting

Plug 'rust-lang/rust.vim'                   " Rust highlighting, formatting

Plug 'tpope/vim-surround'					" Surroundings (parantheses, brackets, quotes, tags)
Plug 'tpope/vim-repeat'						" Repeat non-native commands with '.'

"Plug 'wakatime/vim-wakatime'                " Wakatime plugin

call plug#end()

source $HOME/.config/nvim/plug-settings/lightline.vim
source $HOME/.config/nvim/plug-settings/ranger.vim
source $HOME/.config/nvim/plug-settings/rust.vim
