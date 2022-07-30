set nocompatible        "

syntax enable           " Enable syntax highlighting


"" Cursor
set ruler               " Show cursor position at all times
set relativenumber      " Relative line numbers
set number              " Show actual line number on current line


"" Formatting / Visuals
set t_Co=256            " Support 256 colors
set tabstop=2           " Insert 2 spaces for tabs
set shiftwidth=2        " Number of spaces to use for each indent
set noshowmode          " Don't display mode (It's already displayed in lightline)
set breakindent         " Stay indented after linebreaks
set nowrap              " Don't wrap long lines

"" Search
set ignorecase          " ignore case when searching
set smartcase           " no automatic ignore-case switch
set hlsearch            " highlight search results
set incsearch           " highlight as you type


"" Misc
set encoding=utf-8      " Use UTF-8 Encoding
