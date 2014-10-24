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
" plugin on GitHub repo
" Plugin for colorscheme
Plugin 'sjl/badwolf'
" Plugin for autocomplete
Plugin 'Valloric/YouCompleteMe'

" Plugin for exploring your filesystem and to open files and directories
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Plugin for 'Tag List' provides an overview of the structure of source 
" code files and allows you to efficiently browse through source code 
" files for different programming languages
Plugin 'artemkin/taglist.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" People: Xiaoqin Steven Yang 
" Email: sirxqyang@gmail.com
" Date: Sept 30, 2014
"
" Colors {{{
syntax enable           " enable syntax processing
colorscheme badwolf
set background=dark
set cursorline
" }}}

" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
" set nocursorline          " highlight current line
set wildmenu
" "set lazyredraw
set showmatch           " higlight matching parenthesis
" }}}


" Set font according to system
if has("mac") || has("macunix")
     set gfn=Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
         set gfn=Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("linux")
         set gfn=Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("unix")
         set gfn=Monospace\ 11
endif


" Open MacVim in fullscreen mode
if has("gui_macvim")
     set fuoptions=maxvert,maxhorz
     au GUIEnter * set fullscreen
endif


" fix Delete key problems
:set backspace+=start,eol,indent


" NERDTree setting
" open a NERDTree automatically when vim starts up
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd vimenter * NERDTree
" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>


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


" shortcut 1: insert timestamp via Vim
:iab <expr> tds strftime("%F %b %T")
" shortcut 2: insert my name via Vim
:iab <expr> me 'Xiaoqin Yang @Tongji University;  Email: sirxqyang@gmail.com'

" temporarily switch to a paste model which disable 'auto-indenting' and 'auto-expansion'
nnoremap <F9> :set invpaste paste?<CR>
set pastetoggle=<F9>
set showmode
