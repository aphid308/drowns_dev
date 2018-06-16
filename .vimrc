set nocompatible
set encoding=utf-8
let python_hightlight_all=1
syntax on
filetype on
filetype plugin on
filetype indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimplyFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
Plugin 'wincent/command-t'
Plugin 'flazz/vim-colorschemes'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'othree/html5.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()

set splitbelow
set splitright
set guioptions-=T
set guioptions-=m
colorscheme inkpot

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
inoremap jk <ESC>
set nu
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
set laststatus=2

"Mapping for YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files=1 "let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer=1 "Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax=1 "Completion for programming language keyword
let g:ycm_complete_in_comments=1 "Completion in comments
let g:ycm_complete_in_strings=1 "Completion in string

"Mapping for Ultisnips
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
autocmd FileType python set ft=python.django
autocmd FileType html set ft=htmldjango.html

nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

"Fix Command-T exit bug
if &term =~ "xterm-256color" || &term =~ "screen"
    let g:CommandTCancelMap = ['<ESC>', '<C-c>']
endif
set t_Co=256

autocmd FileType html setlocal shiftwidth=2 tabstop=2

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja
