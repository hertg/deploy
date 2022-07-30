call plug#begin('~/local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'                			" status bar
Plug 'tpope/vim-fugitive'                   			" git integration

Plug 'francoiscabrol/ranger.vim'            			" ranger file manager
Plug 'rbgrouleff/bclose.vim'                			" necessary plugin for ranger

Plug 'airblade/vim-gitgutter'               			" show added/changed lines in git repos
Plug 'ryanoasis/vim-devicons'               			" show icons in nerdtree
Plug 'ntpeters/vim-better-whitespace'       			" highlight unnecessary whitespace
Plug 'dense-analysis/ale'                   			" linting

Plug 'neoclide/coc.nvim', {'branch': 'release'} 	" autocomplete
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-docker', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-go', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-nginx', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-sh', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-sql', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-svelte', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-swagger', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tailwindcss', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-toml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}

Plug 'rust-lang/rust.vim'                   			" Rust highlighting, formatting

Plug 'tpope/vim-surround'													" Surroundings (parantheses, brackets, quotes, tags)
Plug 'tpope/vim-repeat'														" Repeat non-native commands with '.'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }	" Golang

call plug#end()

source $HOME/.config/nvim/plug-settings/lightline.vim
source $HOME/.config/nvim/plug-settings/ranger.vim
source $HOME/.config/nvim/plug-settings/rust.vim
source $HOME/.config/nvim/plug-settings/coc.vim
