set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'kien/ctrlp.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-dispatch'
Plugin 'thoughtbot/vim-rspec'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'kylef/apiblueprint.vim'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'fatih/vim-go'
Plugin 'derekwyatt/vim-scala'
Plugin 'w0ng/vim-hybrid'
Plugin 'vim-scripts/rainbow-end'
Plugin 'mileszs/ack.vim'
Plugin 'christophermca/meta5'
Plugin 'JuliaLang/julia-vim'
Plugin 'nathanaelkane/vim-indent-guides'

let g:rspec_command = "Dispatch ./bin/rspec {spec}"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

if exists("g:ctrlp_user_command")
	unlet g:ctrlp_user_command
endif

" change the mapleader from \ to ,
let mapleader=","

if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 1
  let g:ackprg = 'ag --vimgrep'
else
  " Fall back to using git ls-files if Ag is not available
  let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']
endif

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set background=dark
colorscheme jellybeans
"set background=light
"colorscheme solarized

" remember to use the iterm colorset
"let g:hybrid_use_Xresources = 1
"colorscheme hybrid


syntax on
set backspace=2 " make backspace work like most other apps
set mouse=a
set number

set foldmethod=indent
set foldlevel=1
set clipboard=unnamed

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey


autocmd FileType scala,ruby,c,cpp,html,eruby,erb autocmd BufWritePre <buffer> StripWhitespace
