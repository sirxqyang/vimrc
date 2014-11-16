set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugins to be installed on my mac

" my plugin for colorscheme
Plugin 'reedes/vim-colors-pencil'

" my plugins for autocomplete
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
Plugin 'othree/vim-autocomplpop'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'L9'

" backup plugin for autocomplete
" Plugin 'Valloric/YouCompleteMe'

" my plugins for exploring your filesystem and to open files and directories
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" my plugin for 'Tag List' provides an overview of the structure of source 
" code files and allows you to efficiently browse through source code 
" files for different programming languages
Plugin 'artemkin/taglist.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" People: Xiaoqin Steven Yang 
" Email: sirxqyang@gmail.com
" Date: Sept 30, 2014
"
" Colors {{{
syntax enable           " enable syntax processing
"colorscheme badwolf
colorscheme pencil
set background=light
"let g:pencil_higher_contrast_ui = 0   " 0=low (def), 1=high
"let g:pencil_terminal_italics = 1
"let g:airline_theme = 'pencil'
set cursorline
" }}}


" Indentation changes when opening Python files {{{
:filetype on
:filetype plugin on
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
fu Select_c_style()
    if search('^\t', 'n', 150)
    set shiftwidth=8
    set noexpandtab
    el 
    set shiftwidth=4
    set expandtab
    en
endf
au BufRead,BufNewFile *.c,*.h call Select_c_style()
au BufRead,BufNewFile Makefile* set noexpandtab
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=79
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
let python_highlight_all=1
syntax on
filetype indent on
set autoindent
" }}}

" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
" set nocursorline          " highlight current line
set wildmenu
" "set lazyredraw
set showmatch           " higlight matching parenthesis
" }}}


" whitespace display {{{
set listchars=tab:▸\ ,eol:¬
:set list
" }}}


" Set font according to system {{{
if has("mac") || has("macunix")
     set gfn=Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
         set gfn=Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("linux")
         set gfn=Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("unix")
         set gfn=Monospace\ 11
endif
" }}}


" Open MacVim in fullscreen mode {{{
if has("gui_macvim")
     set fuoptions=maxvert,maxhorz
     au GUIEnter * set fullscreen
endif
" }}}


" fix Delete key problems {{{
:set backspace+=start,eol,indent
" }}}


" NERDTree setting {{{
" open a NERDTree automatically when vim starts up
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd vimenter * NERDTree
" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

" NERDTree mappings
"nnoremap <silent> <F9> :NERDTreeToggle <cr>
"inoremap <silent> <F9> <Esc>:NERDTreeToggle <cr>

" Taglist setting
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
" Put the Taglist window on the right
let Tlist_Use_Right_Window=1
" the tags tree for the current buffer is automatically opened 
" and for all the other buffers is closed
let Tlist_File_Fold_Auto_Close=1

" Automatically Quit Vim if NERDTree and TagList are the only 2 Buffers Left
let Tlist_Exit_OnlyWindow=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" }}}


" FileHeading {{{

" shortcut 1: insert timestamp via Vim
:iab <expr> tds '# Timestamp: '.strftime("%F %b %T")
" shortcut 2: insert my name via Vim
:iab <expr> me '# Author: Xiaoqin Yang @Tongji University;  Email: sirxqyang@gmail.com'

function FileHeading()
  let s:line=line(".")
  call setline(s:line, "\#! /usr/bin/env python")
  call append(s:line, "")
  call append(s:line+1, "\# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
  call append(s:line+2,"\# Author - Xiaoqin Yang @ Tongji University")
  call append(s:line+3,"\# Email - sirxqyang@gmail.com")
  call append(s:line+4,"\# Timestamp - " .strftime("%x %X (%Z)"))
  call append(s:line+5,"\#")
  call append(s:line+6,"\# Description - ")
  call append(s:line+7, "\# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
  call append(s:line+8, "")
  unlet s:line
endfunction

imap <F10> <Esc>mz:execute FileHeading()<CR>`zjA
" }}}


" temporarily switch to a paste model which disable 'auto-indenting' and 'auto-expansion' {{{
nnoremap <F9> :set invpaste paste?<CR>
set pastetoggle=<F9>
set showmode
" }}}


" setting for auto-complete {{{
let g:acp_behaviorSnipmateLength = 1
" }}}


